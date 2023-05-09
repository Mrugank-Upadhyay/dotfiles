# Add custom scripts folder
[[ -d $HOME/scripts ]] && export PATH=$HOME/scripts:$PATH

# Node Modules path
export PATH=$HOME/.node_modules/bin:$PATH

# Java
export JAVA_HOME="/usr/lib/jvm/default"

# Android/Flutter
# export PATH="$PATH:/opt/android-sdk/platform-tools"
# export PATH="$PATH:/opt/android-sdk/emulator"
# export PATH="$PATH:/opt/android-sdk/tools"
# export PATH="$PATH:/opt/android-sdk/tools/bin"
# export JAVA_OPTS="-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee"
# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
# export ANDROID_SDK_ROOT="/opt/android-sdk"

# Needed here by other programs
autoload -Uz compinit
compinit

# Plugin configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="ON"

# SET HIST
SAVEHIST=3000
HISTFILE=~/.zsh_history

# Module load
zmodload zsh/zpty

# Statically load plugins
source $HOME/.config/zsh/plugins.sh

# SSH Agent for easier remote file editing
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  { eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"; } &>/dev/null
fi

# kitty terminal completion
kitty + complete setup zsh | source /dev/stdin
_comp_options+=(globdots)

# Personal aliases:
# Update zsh plugins
alias zsh-update="antibody bundle < $HOME/.config/zsh/plugins > $HOME/.config/zsh/plugins.sh"
# Pipe to clip board
alias clip='xclip -selection clipboard'
# rmtrash aliases
alias rm='rmtrash --forbid-root'
alias rmdir='rmdirtrash --forbid-root'
# Better ls
alias ls="exa"
alias ll="exa -lah"
# logout
alias logout="wayland-logout"
# Better cat
alias cat="bat"
# Prefer neovim but not the extra character
alias vim='nvim -p'
# Zathura should 'devour' the terminal
alias zathura='~/scripts/devour zathura'
# Docker Compose
alias docker-compose='sudo docker-compose'
# Alias yay to paru
alias yay='paru'
# Replay buffer alias
alias start-replay-buffer='nohup obs --startreplaybuffer --minimize-to-tray &'
alias npm="pnpm"
