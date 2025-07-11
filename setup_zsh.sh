#!/bin/bash


# Exit immediately if a command exits with a non-zero status
# set -e

SOURCE_DIRECTORY=$(dirname "$(realpath "$0")")
TARGET_DIRECTORY="$HOME/.config"
###########################
# Symbolic link for zsh   #
###########################

# Install zsh
sudo apt-get install zsh

# Create a symbolic link for zsh
ln -sf "${SOURCE_DIRECTORY}/zsh/.zshrc" ~/.zshrc

(
# Install oh my zsh inside a subshell to prevent it the zsh install script from
# replacing the current.
RUNZSH=no CHSH=no sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
)

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install autosuggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install fzf
sudo apt install fzf

###########################
echo "Setup completed successfully!"
