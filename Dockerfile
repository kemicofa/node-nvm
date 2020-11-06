FROM ubuntu:bionic

ENV NODE_VERSION_8 8
ENV NODE_VERSION_10 10
ENV NODE_VERSION_12 12
ENV NODE_VERSION_DEFAULT $NODE_VERSION_12

RUN apt update \
    && apt -y upgrade \
    && apt -y install software-properties-common curl

RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
    && apt -y install python3.4

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash \
    && chmod -R -xr ~/.nvm/nvm.sh

RUN . /root/.bashrc \
    && nvm install $NODE_VERSION_8 \
    && npm install -g yarn \
    && nvm install $NODE_VERSION_10 \
    && npm install -g yarn \
    && nvm install $NODE_VERSION_12 \
    && npm install -g yarn \
    && nvm alias default $NODE_VERSION_DEFAULT

CMD ["/bin/bash"]