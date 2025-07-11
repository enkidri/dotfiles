#!/bin/bash

# NOTE: Assumes that you are running on bash

# Exit immediately if a command exits with a non-zero status
set -e

SOURCE_DIRECTORY=$(dirname "$(realpath "$0")")
###########################
# Symbolic link for neovim#
###########################

# Install the newest version of nodejs for coc.nvim
curl -sL install-node.vercel.app/lts | bash

# NOTE: Will likely require more configuration outside this
rm -rf $TARGET_DIRECTORY/nvim
ln -sf "${SOURCE_DIRECTORY}/nvim" ~/.config

###########################
echo "Setup completed successfully!"
