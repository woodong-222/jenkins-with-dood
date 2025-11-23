FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && \
    apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && \
    apt-get -y install docker-ce-cli docker-compose-plugin docker-buildx-plugin

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*