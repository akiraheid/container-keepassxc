name:=keepassxc

args:=--rm \
	-e DISPLAY=unix${DISPLAY} \
	--name $(name) \
	-v ${HOME}/.config/keepassxc:/root/.config/keepassxc \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /usr/share/X11/xkb/:/usr/share/X11/xkb/:ro

# Default target
container:
	podman build -t $(name) .

clean:
	podman container prune -f

run: container
	podman run $(args) -d $(name)

stop:
	podman stop $(name)

test: container
	podman run $(args) --entrypoint /bin/sh -it $(name)

.PHONY: clean container run stop test
