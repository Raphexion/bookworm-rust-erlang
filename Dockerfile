FROM rust:1.79-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    libssl-dev \
    libgmp-dev \
    libsqlite3-dev \
    make \
    cmake \
    gcc \
    g++ \
    clang \
    libclang-dev \
    pkg-config \
    erlang \
    rebar3 \
    silversearcher-ag \
    bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#  _   _ ___  ___ _ __
# | | | / __|/ _ \ '__|
# | |_| \__ \  __/ |
#  \__,_|___/\___|_|

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g $GROUP_ID aris && \
    useradd -m -u $USER_ID -g $GROUP_ID -s /bin/bash aris

RUN mkdir -p /home/aris/work && \
    chown -R aris:aris /home/aris/work

USER aris

#   __ _       _     _
#  / _(_)_ __ (_)___| |__
# | |_| | '_ \| / __| '_ \
# |  _| | | | | \__ \ | | |
# |_| |_|_| |_|_|___/_| |_|

WORKDIR /home/aris/work

ENTRYPOINT ["/bin/bash"]
