FROM ubuntu:groovy

ENV NODE_VERSION_DEFAULT 12

RUN sudo apt install -y curl software-properties-common \
    && sudo add-apt-repository ppa:deadsnakes/ppa \
    && sudo apt update \
    && sudo apt install -y python3.4

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash \
    && chmod -x ~/.nvm/nvm.sh

RUN nvm install 8 \
    && npm install -g yarn \
    && nvm install 10 \
    && npm install -g yarn \
    && nvm install 12 \
    && npm install -g yarn \
    && nvm alias default $NODE_VERSION_DEFAULT
