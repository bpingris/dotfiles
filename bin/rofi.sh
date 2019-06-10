#!/bin/sh

usage() {
    cat << EOF
-h      open this help
-p      power menu (suspend, shutdown, disconnect)
-s      screenshot
-d      drun
EOF
}

notif() {
    notify-send $@
}

powermenu() {
    local RES=$(echo -e "Lock\nSuspend\nLogout\nReboot\nShutdown" | rofi -dmenu -i -sync -width 225 -lines 5 -theme ~/.config/rofi/material.rasi)
    case $RES in
        Lock)
            betterlockscreen --lock ;;
        Suspend)
            betterlockscreen --lock && systemctl suspend;;
        Logout)
            i3-msg exit;;
        Reboot)
            systemctl reboot;;
        Shutdown)
            systemctl shutdown;;
    esac

}

screenshot() {
    local RES=$(echo -e "full\narea" | rofi -dmenu -i -sync -width 150 -lines 4 -theme ~/.config/rofi/material.rasi)
    local TIMESTAMP="$(date +%Y.%m.%d-%H.%M.%S)"
    local FILENAME=$HOME/Images/screenshots/${TIMESTAMP}.screenshot.png

    case $RES in
        full)
            # wait for rofi do disappear so it wont appear in in the screenshot :D
            sleep 0.5
            maim -u -m 1 $FILENAME
            xclip -selection clipboard -t image/png "$FILENAME"
            notif "Screenshot taken"
            ;;
        area)
            maim -u -m 1 -s $FILENAME
            xclip -selection clipboard -t image/png "$FILENAME"
            notif "Screenshot taken"
            ;;
    esac
}

drun() {
    rofi -show drun -theme ~/.config/rofi/material.rasi
}

case $1 in
    -h)
        usage;;
    -p)
        powermenu;;
    -s)
        screenshot;;
    -d)
        drun;;
    *)
        usage
        exit 1
        ;;
esac

