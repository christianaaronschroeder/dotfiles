# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1

# theme
ZSH_THEME="spaceship"

ENABLE_CORRECTION="false"

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

source $ZSH/oh-my-zsh.sh

