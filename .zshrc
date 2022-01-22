# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
unsetopt beep
# PS1="○ %1~ ⟶   "
#PS0='\n\n'
# PS1="%F{1}%F{16}%K{1} %1~ %k%F{1} %f"
#PS1="%F{1}%F{16}%K{1}    %k%F{1}%K{2} %f%k%F{16}%K{2} %1~ %k%f "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
(cat ~/.cache/wal/sequences &)
# The following lines were added by compinstall
setopt extendedglob
zstyle :compinstall filename '/home/thousandv/.zshrc'

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Auto Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 
zmodload zsh/complist
compinit
_comp_options+=(globdots) #include hidden files

# End of lines added by compinstall#

# Alias
alias ls="lsd --color=auto"
alias la="lsd -la --color=auto"
alias ll="lsd -l --color=auto"
alias rm="rm -I"
alias pls="sudo"
alias sx='startx'
alias c='xclip -sel clip'
alias sc='find ~/scripts/utility -iname "*.sh" | fzf | bash'
alias nc="fd . ~/.config -E 'VSCodium' -E sportify -E Bitwarden  -E BraveSoftware -E discord -E '*.png' -E 'Code*' -E chromium -E 'awesome-back*' --type=file | fzf --color=dark| xargs -r nvim"
alias mv='mv -vi'
alias icat='kitty +kitten icat'


# Env Variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg
export EDITOR="nvim"
# export VIMINIT='source $XDG_CONFIG_HOME/nvim/init.lua'
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export LESSHISTFILE=-
export GOPATH="/home/thousandv/progx/go"
export GOMODCACHE="/home/thousandv/progx/go/pkg/mod"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g "" 2>/dev/null'
export FZF_ALT_C_COMMAND='find .'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git --ignore-dir .local  -f -g "" 2>/dev/null'
export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH="$HOME/.rbenv/bin:$PATH"
# export LC_ALL=C
# export REDDITDL_PATH='/home/thousandv/media/videos/reddit'

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

#Bindkey
bindkey  "^[[H"   	beginning-of-line
bindkey  "^[[F"   	end-of-line
bindkey  "^[[3~"  	delete-char
bindkey  "^[[1;5D"   	backward-word
bindkey  "^[[1;5C"   	forward-word

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
    # PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
fi



source /usr/share/z/z.sh
source /home/thousandv/.config/fsh/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(rbenv init -)"



# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Append a command directly
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
