FROM node:argon
MAINTAINER Alberto Galiana <alberto.galiana@savethecode.com>

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOMJS_BIN "/usr/local/bin/phantomjs"

RUN apt-get -y update --fix-missing
RUN apt-get -y install vim nano curl net-tools bash-completion grc git
RUN npm i -g phantomjs-prebuilt
RUN apt-get clean

COPY /tmp/github_rsa /root/.ssh/
COPY /tmp/github_rsa.pub /root/.ssh/
COPY /tmp/.gitconfig /root/
COPY /tmp/.bashrc /root/
COPY /docker_entrypoint.sh /

RUN chmod +x /docker_entrypoint.sh
ENTRYPOINT ["/docker_entrypoint.sh"]

WORKDIR /src/savethecode

VOLUME ["/src/savethecode"]
EXPOSE 8080