#!/usr/bin/env bash
RED="\033[0;31m"
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
NC="\033[0m"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Figure out which distro we're using (primarily mac vs linux)
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

printf "${GREEN}----------------------------------${NC}\n"
printf "${GREEN}| Initializing DEV Environment... |${NC}\n"
printf "${YELLOW}| Setting up for ${MACHINE}   |${NC}\n"
printf "${GREEN}----------------------------------${NC}\n\n"

mkdir -p ~/.config

ls
echo SCRIPT_DIR

if [[ $MACHINE == "Mac" ]]; then
    printf "${GREEN}Installing XCode dev tools...${NC}\n"
    xcode-select --install
fi

printf "${GREEN}Installing tpm (Tmux Package Manager)...${NC}\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    printf "${GREEN}Installing Homebrew...${NC}\n"
    export NONINTERACTIVE=1 # Don't ask for passwords
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
else
    printf "${YELLOW}Homebrew already installed. Updating...${NC}\n"
    brew update
fi

printf "${GREEN}Installing Homebrew bundles...${NC}\n"
brew bundle

printf "${GREEN}Copying .bash/zshrc files to user directory...${NC}\n"
cp "${SCRIPT_DIR}/.zshrc" ~/.zshrc

if [ -z "$BASH_VERSION" ]; then
    printf "${GREEN}Setting ZSH as default shell (requires password)...${NC}\n"
    chsh -s $(which zsh)
fi

printf "${GREEN}Updating PATH...${NC}\n"
echo -e "\nexport PATH=${SCRIPT_DIR}:\$PATH" >> ~/.zshrc

cp "${SCRIPT_DIR}/starship.toml" ~/.config/starship.toml

mkdir -p ~/.config/alacritty
cp "${SCRIPT_DIR}/alacritty.toml" ~/.config/alacritty/alacritty.toml

cp "${SCRIPT_DIR}/.tmux.conf" ~/.tmux.conf

printf "${GREEN}Copying over nvim config...${NC}\n"
rsync -aqz "${SCRIPT_DIR}/nvim" ~/.config/nvim/

printf "\n${GREEN}-------- [ COMPLETE ] --------${NC}\n"
printf "${GREEN}Bye 👋🏻${NC}\n"
