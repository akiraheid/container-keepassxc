FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends keepassxc
RUN mkdir -p /home/keepassxc && \
	chmod -R 500 /home/keepassxc && \
	addgroup keepassxc && \
	adduser --disabled-password --ingroup keepassxc \
		--home /home/keepassxc keepassxc

USER keepassxc
ENTRYPOINT ["keepassxc"]
