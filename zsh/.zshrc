
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep
# End of lines configured by zsh-newuser-install

# Hisotry config
setopt appendhistory
setopt sharehistory
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias ls='ls -a --color'

# Path variables
typeset -U path PATH

path+=(~/.local/bin)

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.json)"

# Load custom aliases as functions to support multiple lines
if [[ -d ~/.dotfiles/zsh/aliases ]]; then
    for file in ~/.dotfiles/zsh/aliases/*; do
        if [ -f "$file" ]; then
            cmd_name=$(basename "$file")
            # Define a function dynamically that sources the file and passes all arguments
            eval "${cmd_name}() { source '$file' \"\$@\" }"
        fi
    done
fi

# Interactive help command using fzf
help() {
    if ! command -v fzf &> /dev/null; then
        echo "Error: 'fzf' is required for the interactive help. Please install it."
        return 1
    fi
    
    local selected
    selected=$(command ls -1 ~/.dotfiles/zsh/aliases 2>/dev/null | fzf --prompt="Select an alias > " --preview 'cat ~/.dotfiles/zsh/aliases/{}')
    
    if [[ -n "$selected" ]]; then
        # Places the selected alias into the zsh prompt buffer
        print -z "$selected "
    fi
}
