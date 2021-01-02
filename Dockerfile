# podman run -d --rm \
# 	--name $NAME \
# 	-e DISPLAY=unix${DISPLAY} \
# 	-v ${HOME}/.config/keepassxc/:/root/.config/keepassxc/ \
# 	-v ${HOME}/path/to/keepassxc.kdbx:/root/.config/keepassxc/keepassxc.kdbx \
# 	-v /etc/machine-id:/etc/machine-id:ro \
# 	-v /tmp/.X11-unix:/tmp/.X11-unix \
# 	-v /usr/share/X11/xkb/:/usr/share/X11/xkb/:ro \
# 	localhost/keepassxc

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends keepassxc

ENTRYPOINT ["keepassxc"]
