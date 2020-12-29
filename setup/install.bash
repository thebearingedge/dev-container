#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

yes | unminimize
apt-get update
apt-get install -y \
  man \
  apt-utils
apt-get install -y -o Dpkg::Options::="--force-confdef" \
                   -o Dpkg::Options::="--force-confold" \
  sudo \
  curl \
  nano \
  htop \
  psmisc \
  locales \
  bash-completion \
  build-essential \
  unzip \
  host \
  httpie \
  telnet \
  iputils-ping \
  netcat-openbsd \
  traceroute

source "$(dirname $BASH_SOURCE)/add-dev-user.bash"
source "$(dirname $BASH_SOURCE)/configure-locale.bash"
source "$(dirname $BASH_SOURCE)/install-git.bash"
source "$(dirname $BASH_SOURCE)/install-postgres.bash"
source "$(dirname $BASH_SOURCE)/install-node.bash"

chown -R dev:dev /home/dev
