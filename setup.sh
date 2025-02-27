#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

SOURCE_DIRECTORY=$(dirname "$(realpath "$0")")

# Symbolic link for neovim
rm -rf $TARGET_DIRECTORY/nvim
ln -sf "${SOURCE_DIRECTORY}/nvim" ~/.config

# Symbolic link for tmux
ln -sf "${SOURCE_DIRECTORY}/tmux/.tmux.conf" ~

echo "Setup completed successfully!"
