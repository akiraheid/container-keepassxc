#!/bin/bash
set -e

CONFIG_DIR=${HOME}/.config/keepassxc

mkdir -p ${CONFIG_DIR}

ARG=""
VOL=""
if [ $# != 0 ]; then
	ARG="/root/data/$(basename $1)"
	VOL="-v $(readlink -f $1):$ARG"
fi

podman run -d \
	-e DISPLAY=unix${DISPLAY} \
	--name keepassxc-$(uuidgen) \
	--rm \
	-v ${CONFIG_DIR}:/root/.config/keepassxc/ \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /usr/share/X11/xkb/:/usr/share/X11/xkb/:ro \
	$VOL \
	localhost/keepassxc $ARG

#	# Stop the existing container if a file is not specified
#	if [ $# == 0 ]; then
#		stopdel keepassxc
#	fi
#
#	ARG="/root/.config/keepassxc/keepassxc.kdbx"
#	NAME="--name keepassxc"
#	VOL=""
#	if [ $# == 1 ]; then
#		ARG="/root/data/$(basename $1)"
#		NAME=""
#		VOL="-v $(readlink -f $1):$ARG"
#	fi
#
#	podman run -d --rm $NAME \
#		-e DISPLAY=unix${DISPLAY} \
#		-v ${HOME}/syncthing/computers/keepassxc/:/root/.config/keepassxc/ \
#		-v /etc/machine-id:/etc/machine-id:ro \
#		-v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v /usr/share/X11/xkb/:/usr/share/X11/xkb/:ro \
#		$VOL \
#		localhost/keepassxc $ARG
