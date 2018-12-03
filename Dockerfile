FROM ubuntu:16.04


RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    nodejs \
    npm \
    jq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    wget \
    cpio \
    chrpath \
    gawk \
    acl \
    sudo

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce

WORKDIR /app

ENV HOME=/home/appuser

RUN groupadd -g 1999 appuser && \
    useradd -r -u 1999 -g appuser appuser && \
    usermod -aG docker appuser && \
    chown appuser /var/log -R && \
    mkdir /home/appuser && \
    chown appuser /home/appuser && \
    mkdir /var/lib/docker && \
    chown appuser /var/lib/docker && \
    mkdir /var/run/docker && \
    chown appuser /var/run/docker -R && \
    chown appuser /var/run/ -R && \
    mkdir /home/appuser/.ssh && \
    ssh-keyscan github.com >> /home/appuser/.ssh/known_hosts

#USER appuser


#RUN groupadd -r bitbaker && useradd --no-log-init -r -g bitbaker bitbaker

#RUN mkdir /home/bitbaker && \
#    chown -R bitbaker:bitbaker /home/bitbaker && \
#    chown -R bitbaker:bitbaker /app

#USER bitbaker
