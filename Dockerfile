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
    sudo \
    locales \
    diffstat \
    texinfo

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce

RUN locale-gen en_US.UTF-8

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

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
    ssh-keyscan github.com >> /home/appuser/.ssh/known_hosts && \
    chown appuser /home/appuser/.ssh -R
