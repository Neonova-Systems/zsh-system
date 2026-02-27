#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
#          ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#          ┃                      Source file in /etc/zsh/zshrc.d                         ┃
#          ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# print -v _ZSH_INIT_TIME -P '%D{%s%N}' # Get info time start

declare -A ZINIT                                                            # Declare an associative array
ZINIT[COMPINIT_OPTS]="-C -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"     # Set options for compinit call(i.e done by `zicompinit`), use to pass -C to speed up loading
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"          # Set directory for dumped completion file, this will speed compinit.

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[[ ! -d $ZINIT_HOME ]] && mkdir -p "$(dirname $ZINIT_HOME)"
[[ ! -d $ZINIT_HOME/.git ]] && git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
. "${ZINIT_HOME}/zinit.zsh" # Enable zsh-plugins-manager(zinit)
 

[[ -d "/etc/zsh/zshrc.d" ]] && { # Check if has /etc/zsh/zshrc.d directory && execute function below
    for file in /etc/zsh/zshrc.d/**/*(.); do # Create for-loop with file in /etc/zsh/zshrc.d/ directory
        eval "$(<${file})" # Check if file is readable && source the file
    done; unset file # End for-loop statement; Clearing variable so that will not polute the shell.
}

#          ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#          ┃                                     END                                      ┃
#          ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
#                   NOTE: Uncomment this below if you want benchmarking this config
# print -v _ZSH_LOADED_TIME -P '%D{%s%N}' # Get info time end
# _ZSH_STARTUP_TIME=$(( ( _ZSH_LOADED_TIME - _ZSH_INIT_TIME ) / 1000000 )) # Calculate differ time between start and end
# info_msg "Startup time: $_ZSH_STARTUP_TIME ms"
