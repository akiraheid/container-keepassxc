name:="keepassxc"
home:="$(shell echo ~/.keepassxc)"
usergroup:=$(shell echo `id -u`:`id -g`)

# Default target
container:
	docker build -t $(name) .

clean:
	docker container prune -f

run: container
	#echo $(shell echo ~)
	docker run --rm --detach --name $(name) \
		-v $(home)/:/home/keepassxc/ \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		--env DISPLAY=$(shell echo ${DISPLAY}) \
		--user $(usergroup) \
		$(name)

stop:
	docker stop $(name)

test: container
	docker run --rm -it \
		--entrypoint /bin/sh \
		$(name)

.PHONY: container run test
