#!/bin/sh

CONTROL_FILE=/tmp/control_volume.bb
muted=`amixer get Master | tail -n1 | awk '{print $NF}'`


if [ -f $CONTROL_FILE ]
then
    VID=`cat $CONTROL_FILE`
else
    VID=`newtify-send "Volume" -t 500 -p`
    echo $VID > $CONTROL_FILE
fi


function unmute_audio {
    if [ $muted = '[off]' ]
    then
	amixer -q sset Master toggle
	muted='[on]'
    fi
}

case $1 in
    'up')
	amixer -q sset Master 5%+
	unmute_audio
	;;
    'down')
	amixer -q sset Master 5%-
	unmute_audio
	;;
    'toggle')
	amixer -q sset Master toggle
	;;
    'help')
	cat <<EOF
USAGE: $0 [command]

COMMANDS:
	up	increase the volume
	down	decrease the volume
	toggle  (un)mute the volume
	help	show this help
EOF
	;;
    *)
	echo "Wat?"
	exit 1
esac

muted=`amixer get Master | tail -n1 | awk '{print $NF}'`
volume=`amixer get Master | tail -n1 | awk '{print $4}' | tr -dc '0-9'`

if [ $muted = '[off]' ]
then
    VID=`newtify-send "Muted" -r $VID -t 1000 -i notification-audio-volume-muted -h int:value:$volume -p`
else
    if [ $volume -gt 66 ]
    then
	volume_id='notification-audio-volume-high'
    elif [ $volume -gt 33 ]
    then
	volume_id='notification-audio-volume-medium'
    elif [ $volume -gt 0 ]
    then
	volume_id='notification-audio-volume-low'
    else
	volume_id='notification-audio-volume-off'
    fi
    VID=`newtify-send "Volume" -r $VID -t 1000 -i $volume_id -h int:value:$volume -p`
fi

echo $VID > $CONTROL_FILE

exit 0
