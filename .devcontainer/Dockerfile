# [Choice] Node.js version: 16, 14, 12
ARG VARIANT="16-buster"
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends fish vim git

RUN su node -c "npm install -g zx"

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN export DEBIAN_FRONTEND=noninteractive && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y docker-ce
COPY docker-init.sh /usr/local/share/docker-init.sh
RUN chown node:node /usr/local/share/docker-init.sh
RUN chmod u+x /usr/local/share/docker-init.sh

ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
