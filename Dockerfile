FROM ubuntu:cosmic

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ GB

RUN \
  apt update && \
  apt install -y \
    curl \
    git \
    locales \
    make \
    tmuxinator \
    tree \
    vim-gtk && \
  locale-gen en_GB en_GB.UTF-8 && dpkg-reconfigure locales && update-locale LANG=en_GB.UTF-8 && \
  rm /usr/bin/tmuxinator && gem install tmuxinator && \
  rm -rf /var/lib/apt/lists/*

ARG GIT_COMMITTER_NAME="Paul Williams"
ARG GIT_COMMITTER_EMAIL 

ENV GIT_COMMITTER_NAME  $GIT_COMMITTER_NAME
ENV GIT_COMMITTER_EMAIL $GIT_COMMITTER_EMAIL

RUN \
  git clone https://github.com/kwakwaversal/dotfiles.git $HOME/.dotfiles && \
  $HOME/.dotfiles/myinstall.sh && \
  mkdir -p $HOME/projects
