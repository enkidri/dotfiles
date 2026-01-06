# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/opt/nvim-linux64/bin:/usr/bin/env:/usr/bin/:~/bin/:/home/setata1/.local/bin:/mnt/c/Documents and Settings/SETATA1/AppData/Local/SumatraPDF/"
alias sumtraPDF=sumatraPDF.exe
export BROWSER='/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'
export VISUAL=nvim
export EDITOR="$VISUAL"

# Theme
ZSH_THEME="refined"

plugins=(git zsh-autosuggestions fzf zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

alias fd=fdfind
source $HOME/.bash_aliases

bindkey -v
bindkey '^ ' autosuggest-accept

# MACROS

# Compiles and run a C++ program
cr() {
  # Compile without speed optimization
  g++ "$1" -o temp_bin || return 1
  
  # Execute the binary
  ./temp_bin
  
  # Capture the exit code into a custom variable
  local exit_code=$?
  
  # Clean up the binary
  rm -f temp_bin
  
  # Return the actual exit code of your program
  return $exit_code
}

crf() {
  # Compile with speed optimization
  g++ "$1" -O3 -DNDEBUG -o temp_bin || return 1
  
  # Execute the binary
  ./temp_bin
  
  # Capture the exit code into a custom variable
  local exit_code=$?
  
  # Clean up the binary
  rm -f temp_bin
  
  # Return the actual exit code of your program
  return $exit_code
}
