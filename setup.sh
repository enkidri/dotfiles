#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

SOURCE_DIRECTORY=$(dirname "$(realpath "$0")")

# Symbolic link for neovim
# NOTE: Will likely require more configuration outside this
rm -rf $TARGET_DIRECTORY/nvim
ln -sf "${SOURCE_DIRECTORY}/nvim" ~/.config

# Symbolic link for tmux
if [ ! -d "~/.tmux/plugins/tpm" ]; then
  mkdir -p ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
ln -sf "${SOURCE_DIRECTORY}/tmux/.tmux.conf" ~
~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Setup completed successfully!"
