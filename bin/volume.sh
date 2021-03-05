#!/bin/sh

help() {
    echo 'volume.sh i|d|m|mm'
}

refresh_i3status() {
    killall -SIGUSR1 i3status
}

VOLUME_ID=10293
MICRO_ID=57812

SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
volume() {
    V=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
    dunstify -u low -r "$VOLUME_ID" "Volume: ${V}%"
}

mute_unmute() {
    local is_muted=$(pacmd list-sinks | awk '/muted/ { print $2 }')
    if [[ $is_muted = "yes" ]]; then
        dunstify -u low -r "$VOLUME_ID" "Muted"
    else
        dunstify -u low -r "$VOLUME_ID" "Unmuted"
    fi
}

mic_mute() {
    local current_source=$(pactl info | grep "Default Source" | cut -f3 -d" ")
    local is_muted=$(pactl list sources | grep -A 10 ${current_source} | awk '/Mute/ {print $2}')
    echo $is_muted
    if [[ $is_muted = "yes" ]]; then
        dunstify -u low -r "$MICRO_ID" "Microphone muted"
    else
        dunstify -u low -r "$MICRO_ID" "Microphone unmuted"
    fi
}

main() {
    case $1 in
        i)
            pactl set-sink-volume @DEFAULT_SINK@ +10% && refresh_i3status
            volume
            ;;
        d)
            pactl set-sink-volume @DEFAULT_SINK@ -10% && refresh_i3status
            volume
            ;;
        m)
            pactl set-sink-mute @DEFAULT_SINK@ toggle && refresh_i3status
            mute_unmute
            ;;
        mm)
            pactl set-source-mute @DEFAULT_SOURCE@ toggle && refresh_i3status
            mic_mute
            ;;
        *)
            help;;
    esac
}
main $@
