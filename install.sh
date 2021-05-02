#!/bin/bash
set -e

# Install keepassxc container app

APP=~/.local/share/applications
BIN=~/.local/bin

mkdir -p $APP $BIN

# Install the executable
cp bin/keepassxc.sh $BIN/keepassxc

# Install desktop shortcut
cp keepassxc.desktop $APP/

if [ -z "`which keepassxc`" ]; then
	echo "Add '~/.local/bin' to your PATH and restart your computer"
fi

echo "Done!"
