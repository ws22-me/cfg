# ~/.zshrc: executed by zsh(1) for interactive shells.

# If not running interactively, don't do anything
[[ -o interactive ]] || return

# History settings
setopt hist_ignore_all_dups  # Don't record duplicate commands
setopt hist_ignore_space     # Don't record commands starting with space
setopt append_history        # Append to history file instead of overwriting

# History size (unset in original, so using Zsh defaults unless you specify)
# HISTSIZE=1000              # In-memory history size (default)
# HISTFILESIZE=2000          # File history size (default)
HISTFILE=~/.zsh_history      # Where to save history

# Enable prompt substitution
setopt prompt_subst

# Chroot identification
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set up prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment to force color prompt
# force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
    if command -v tput &>/dev/null && tput setaf 1 &>/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Define prompt with proper Zsh syntax
if [[ "$color_prompt" = yes ]]; then
    PS1='%F{green}${debian_chroot:+$debian_chroot:}%n@%m%f:%F{blue}%~%f$ '
else
    PS1='${debian_chroot:+$debian_chroot:}%n@%m:%~$ '
fi
unset color_prompt force_color_prompt

# Set terminal title for xterm
case "$TERM" in
    xterm*|rxvt*)
        precmd() { print -Pn "\e]0;${debian_chroot:+$debian_chroot:}%n@%m: %~\a" }
        ;;
esac

# Enable color support and aliases
if command -v dircolors &>/dev/null; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Additional ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Source aliases file if it exists
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# Enable completion
autoload -Uz compinit
compinit
# Source system-wide completions if available
[[ -f /usr/share/zsh/functions/Completion/zsh_completion ]] && source /usr/share/zsh/functions/Completion/zsh_completion
[[ -f /etc/zsh_completion ]] && source /etc/zsh_completion

# Enable zoxide and atuin if installed
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v atuin &>/dev/null && eval "$(atuin init zsh --disable-up-arrow)"

# Config alias and PATH
alias config='$(which git) --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export PATH=$PATH:$HOME/setup/tools/bin/nvim-linux64/bin:$HOME/setup/tools/bin

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word