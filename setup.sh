#!/usr/bin/env bash
RED="\033[0;31m"
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
NC="\033[0m"

printf "${GREEN}---------------------------------${NC}\n"
printf "${GREEN}| Initializing DEV Environment... |${NC}\n"
printf "${GREEN}---------------------------------${NC}\n\n"

printf "${GREEN}Installing tpm (Tmux Package Manager)...${NC}\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    printf "${GREEN}Installing Homebrew...${NC}\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    printf "${YELLOW}Homebrew already installed. Updating...${NC}\n"
    brew update
fi

printf "${GREEN}Installing Homebrew bundles...${NC}\n"
brew bundle