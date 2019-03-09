#!/usr/bin/env bash

BACKUP_DIR=/home/benoit/backup/`date +%Y-%m-%d`
FILES="
	$HOME/.zshrc
	$HOME/.config/i3
	$HOME/.config/polybar
	$HOME/.config/nvim
	$HOME/bin
    $HOME/.config/fish
    $HOME/.config/oni/config.tsx
    $HOME/.config/oni/config.js
    $HOME/Work/Perso/speedtest
    $HOME/.zshrc
	"
	
mkdir -p $BACKUP_DIR

for FILE in $FILES
do
	cp -r $FILE $BACKUP_DIR
done
