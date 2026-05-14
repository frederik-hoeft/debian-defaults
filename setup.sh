#!/usr/bin/env bash

set -euo pipefail

# ensure we're running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# install core dependencies
apt-get update
apt-get install -y --no-install-recommends \
    vim \
    wget \
    git \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

chsh -s "$(which zsh)"

# setup ohmyzsh
mkdir -p /opt/shared/oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
mv ~/.oh-my-zsh /opt/shared/oh-my-zsh/oh-my-zsh
wget https://raw.githubusercontent.com/frederik-hoeft/dot-files/refs/heads/main/default.zshrc -O /opt/shared/oh-my-zsh/zshrc
echo "source /opt/shared/oh-my-zsh/zshrc" > ~/.zshrc

wget https://raw.githubusercontent.com/frederik-hoeft/dot-files/refs/heads/main/default.vimrc -O ~/.vimrc