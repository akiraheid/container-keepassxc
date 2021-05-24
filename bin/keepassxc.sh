#!/bin/bash
set -e

CONFIG_DIR=${HOME}/.config/keepassxc

mkdir -p ${CONFIG_DIR}

ARG=""
VOL=""
if [ $# == 1 ]; then
	ARG="/root/data/$(basename $1)"
	VOL="-v $(dirname $(readlink -f $1)):/root/data"
fi

podman run \
	-d \
	-e DISPLAY=unix${DISPLAY} \
	--name keepassxc-$(uuidgen) \
	--rm \
	-v ${CONFIG_DIR}:/root/.config/keepassxc/ \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /usr/share/X11/xkb/:/usr/share/X11/xkb/:ro \
	$VOL \
	localhost/keepassxc $ARG
