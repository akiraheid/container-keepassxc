name:=keepassxc

# Default target
container: Dockerfile
	podman build -t $(name) .

clean:
	podman container prune -f

run: container
	bash bin/keepassxc.sh

stop:
	podman stop $(name)

.PHONY: clean container run stop
