#!/bin/bash

# NOTE: Assumes that you are running on bash

# Exit immediately if a command exits with a non-zero status
set -e

SOURCE_DIRECTORY=$(dirname "$(realpath "$0")")
TARGET_DIRECTORY="$HOME/.config"
###########################
# Setup for neovim        #
###########################
./setup_nvim.sh

###########################
# Setup for zsh           #
###########################
./setup_zsh.sh

###########################
# Symbolic link for tmux  #
###########################
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  mkdir -p "$HOME/.tmux/plugins/tpm"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
ln -sf "${SOURCE_DIRECTORY}/tmux/.tmux.conf" ~
set +e 
tmux source ~/.tmux.conf 
set -e
bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh

###########################
# Symbolic link for bash  #
###########################
# NOTE: Dependencies
#   - starship
#   - sudo apt install fd-find
#   - sudo apt install fzf
ln -sf "${SOURCE_DIRECTORY}/bash/.bashrc" ~
ln -sf "${SOURCE_DIRECTORY}/bash/.inputrc" ~

###########################
echo "Setup completed successfully!"
