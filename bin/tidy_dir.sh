#!/usr/bin/env bash


IMAGES_DIR="./images/"
DOCS_DIR="./documents/"
VIDEOS_DIR="./videos/"
FONTS_DIR="./fonts/"

create_dirs() {
    mkdir -p $IMAGES_DIR &&
    mkdir -p $DOCS_DIR &&
    mkdir -p $VIDEOS_DIR &&
    mkdir -p $FONTS_DIR
    return $?
}

log_and_move() {
    local filename=$1
    local directory=$2

    echo "[*] Moving $filename to $directory"
    mv $filename $directory
}

process_file() {
    local filename=$1
    mime_type=$(file -b --mime-type $filename)

    case $mime_type in
    image/*)
        log_and_move $filename $IMAGES_DIR
        ;;
    video/*)
        log_and_move $filename $VIDEOS_DIR
        ;;
    audio/*)
        log_and_move $filename $AUDIO_DIR
        ;;
    application/*)
        log_and_move $filename $DOCS_DIR
        ;;
    font/*)
        log_and_move $filename $FONTS_DIR
        ;;
    esac
}

main() {
    create_dirs
    if [ "$?" ]
    then
        for filename in ./*
        do
            process_file $filename
        done
        echo "Done."
    else
        echo 'An error occured while creating the directories'
        return 1
    fi

    return 0
}

main
