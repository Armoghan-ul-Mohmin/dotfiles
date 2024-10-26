# ============================================================ #
# Zsh Configuration File (.zshrc)
# ============================================================ #
# Configures Zsh with plugins and settings
# Managed with Zinit for enhanced performance
# ============================================================

# ========================= Zsh Plugin Manager ========================= #
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
# ======================================================================= #

# ============================= fzf Setup ============================== #
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

FZF_TAB_DIR="${ZINIT_HOME}/plugins/Aloxaf/fzf-tab"
if [ ! -d "$FZF_TAB_DIR" ]; then
    git clone https://github.com/Aloxaf/fzf-tab.git "$FZF_TAB_DIR"
fi
source "$FZF_TAB_DIR/fzf-tab.zsh"
# ======================================================================= #

# ========================= Plugins Setup ============================== #
zinit light zsh-users/zsh-syntax-highlighting   # Syntax highlighting
zinit light zsh-users/zsh-autosuggestions       # Command autosuggestions
zinit light zsh-users/zsh-completions           # Additional completions
# ======================================================================= #

# ======================== Load Zsh Completion System =================== #
autoload -U compinit && compinit
# ======================================================================= #

# ========================= Snippets Setup ============================== #
# Quickly jump to directories based on history
zinit snippet OMZP::autojump
# Suggest commands when not found
zinit snippet OMZP::command-not-found
# Enhance Git commands with additional features
zinit snippet OMZP::git
# Correct previous command with suggestions
zinit snippet OMZP::thefuck
# ======================================================================= #

# ========================== thefuck Initialization ===================== #
eval $(thefuck --alias)
# ======================================================================= #

# ======================== History Configuration ========================= #
HISTSIZE=10000             # Commands in memory
SAVEHIST=10000             # Commands in history file
HISTFILE=~/.zsh_history    # History file
HISTDUP=erase              # Erase duplicates

setopt autocd               # change directory just by typing its name
setopt notify               # report the status of background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt
setopt appendhistory        # Append to history file
setopt hist_ignore_all_dups # Ignore duplicate commands
setopt hist_ignore_space    # Ignore commands starting with a space
setopt hist_reduce_blanks   # Reduce blank lines
setopt share_history        # Share history across sessions
setopt inc_append_history   # Incrementally append to history
setopt hist_find_no_dups    # No duplicates in history
# ======================================================================= #

# ========================= Completion Styling ========================== #
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'             # Case insensitive
zstyle ':completion:*:messages' format '%F{yellow}%d%f'         # Warning messages format
zstyle ':completion:*:warnings' format '%F{red}%d%f'            # Completion warnings format
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}   # List colors
zstyle ':completion:*:default' format '%F{magenta}%d%f'         # Default format for items
zstyle ':fzf-tab:completion:cd*:' fzf-preview 'ls --color=auto' # Preview for `cd` command
# ======================================================================= #

# ========================== APT Command Wrapper ========================== #
apt() {
    command nala "$@"
}

sudo() {
    if [ "$1" = "apt" ]; then
        shift
        command sudo nala "$@"
    else
        command sudo "$@"
    fi
}
# ======================================================================= #

# ========================= Compression Functions ========================== #
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extrach <file>"
        return 1
    fi

    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.tar.xz)  tar xJf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.rar)     unrar x "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.tbz2)    tar xjf "$1" ;;
            *.tgz)     tar xzf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1" ;;
            *)         echo "'$1' cannot be extracted via extrach()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

compress() {
    if [ -z "$1" ]; then
        echo "Usage: compress <file_or_directory>"
        return 1
    fi

    if [ ! -e "$1" ]; then
        echo "'$1' is not a valid file or directory"
        return 1
    fi

    format=$(printf "\ntar.gz\ntar.bz2\nzip\n7z\nbz2\nrar\ntar.xz\ntgz\n" | \
        fzf --header="Select compression format:" --height=50% --reverse --border --prompt='🔍 ')

    case "$format" in
        tar.gz)  tar czf "$1.tar.gz" "$1" ;;
        tar.bz2) tar cjf "$1.tar.bz2" "$1" ;;
        zip)     zip -r "$1.zip" "$1" ;;
        7z)      7z a "$1.7z" "$1" ;;
        bz2)     bunzip2 "$1" ;;
        rar)     rar a "$1.rar" "$1" ;;
        tar.xz)  tar cJf "$1.tar.xz" "$1" ;;
        tgz)     tar czf "$1.tgz" "$1" ;;
        *)       echo "No valid format selected" ;;
    esac
}
# ======================================================================= #

# ===================== Dissable Weird Highlighting ===================== #
export LS_COLORS="di=34;49:ln=36;49:tw=34;49:ow=34;49:"
# ======================================================================= #

# =============================== Aliases =============================== #

# File and Directory Management
alias ls='ls --color=auto'             # List files with color
alias la='ls -al --color=auto'         # List all files with details and color
alias dir='dir --color=auto'           # List directory contents with color
alias vdir='vdir --color=auto'         # List directory contents in a vertical format with color
alias ..='cd ..'                       # Go up one directory
alias ...='cd ../..'                   # Go up two directories
alias ....='cd ../../..'               # Go up three directories
alias cls='clear'                      # Clear the terminal screen
alias cat='batcat'                     # Use batcat for enhanced file viewing

# Package Management
alias install='sudo apt install'       # Install a package with sudo
alias remove='sudo apt remove'         # Remove a package with sudo

# File Operations
alias rm='rm -i'                       # Prompt before removing files
alias cp='cp -i'                       # Prompt before copying files
alias mv='mv -i'                       # Prompt before moving files

# Git Operations
alias gp='git.exe push'                # Push changes to the remote repository
alias gpl='git pull'                   # Pull changes from the remote repository
alias gs='git status'                  # Show git status
alias ga='git add'                     # Add changes to the staging area
alias t='tig'                         # Use Tig Git Enhance Viewer

# Networking
alias ip='curl ipinfo.io/ip'          # Get your public IP address

# Development Tools
alias code='code .'                    # Open Visual Studio Code in current directory
alias help='tldr --color always'       # Use tldr with color support
alias lg='lazygit.exe'                 # Launch LazyGit
alias z='zellij'                       # Launch Zellij
alias github='cd /mnt/f/Github'        # Change dir to github

# Docker Management
alias dps='docker ps'                  # List running Docker containers
alias dpa='docker ps -a'               # List all Docker containers
alias di='docker images'               # List Docker images

# Miscellaneous
alias h='history'                      # Show command history
alias path='echo $PATH'                # Display the current PATH variable
alias grep='grep --color=auto'         # Highlight matching text in grep
alias gui='kex --win -s'		           # Open WinKex Gui

#  Distrobox
alias alpine="distrobox enter alpine"   # Open Alpine Distrobox Container
alias fedora="distrobox enter fedora"   # Open Fedora Distrobox Container
alias arch="distrobox enter arch"       # Open Arch Distrobox Container

# ======================================================================= #

# ========================== PATH Configuration ========================== #
export PATH="$HOME/.cargo/bin:$PATH"                     # Cargo binaries
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"       # Homebrew binaries
export PATH="$HOME/.nix-profile/bin:$PATH"		           # Nix binaries
export PATH="/usr/local/sbin:$PATH"                      # Local sbin
export PATH="/usr/local/bin:$PATH"                       # Local bin
export PATH="/usr/sbin:$PATH"                            # System sbin
export PATH="/usr/bin:$PATH"                             # System bin
export PATH="/sbin:$PATH"                                # Essential sbin
export PATH="/bin:$PATH"                                 # Essential bin
export PATH="/usr/lib/wsl/lib:$PATH"                     # WSL libraries
export PATH="/mnt/c/Users/armoghan/AppData/Local/Microsoft/WindowsApps:$PATH"  # Windows Apps
export PATH=$PATH:/usr/local/bin/npm                     # NPM binaries
# ======================================================================= #

# ========================== Starship Initialization ===================== #
eval "$(starship init zsh)"
# ======================================================================= #

# ========================= Custom Functions ========================== #

# Copy content of a file to the clipboard
copy() {
    if [[ -f "$1" ]]; then
        cat "$1" | xclip -selection clipboard
        echo -e "\e[32m✅ Content copied to clipboard from $1\e[0m"
    fi
}

# Search files in the specified directory (or current directory) using Fzf and edit with nvim
edit() {
    local dir="${1:-.}"
    local file

    # Use fzf to select a file while excluding certain directories
    file=$(find "$dir" -type d \( -name '.git' -o -name 'node_modules' -o -name 'vendor' \) -prune -o -type f -print | fzf \
        --preview 'batcat --style=numbers --color=always {}' \
        --preview-window=right:55% \
        --header='🎉  Select a file to edit  🎉' \
        --border \
        --reverse \
        --height=95% \
        --prompt='🔍  ')

    if [[ -n $file ]]; then
        nvim "$file" 
    fi
}

# Function to search for and print file paths
print_file_path() {
    local file

    file=$(find . -type f | fzf \
        --preview 'batcat --style=numbers --color=always {}' \
        --preview-window=right:60%:wrap \
        --header='🎉  Select a file to print its path  🎉' \
        --border \
        --height=95% \
        --ansi \
        --prompt='🔍  Search for files: ' \
        --info=inline)

    if [[ -n $file ]]; then
        echo $file
    fi
}

# Function to kill a process using fzf
stop() {
    local process_id

    # Use fzf to select a process
    process_id=$(ps -aux | awk '{print $2, $3, $4, $10, $11}' | fzf \
        --header='🔫 Select a process to kill' \
        --height=50% \
        --reverse \
        --border \
        --ansi \
        --prompt='🔍  ' | awk '{print $1}')  

    if [[ -n $process_id ]]; then
        kill -9 "$process_id" && echo -e "\e[32m✅ Process $process_id killed\e[0m" || echo -e "\e[31m❌ Error: Failed to kill process $process_id\e[0m"
    fi
}

# Function to manage system services using fzf
process() {
    # Check if systemd is available
    if systemctl >/dev/null 2>&1; then
        local service
        service=$(systemctl list-units --type=service --no-pager | awk '{print $1 " " $2 " " $3}' | fzf \
            --header='⚙️  Select a Service (systemd)' \
            --preview 'echo -e "\e[1;34mService Info:\e[0m\n\n\e[1;32mService Name:\e[0m \e[1;36m{1}\e[0m\n\n\e[1;33mStatus:\e[0m\n$(systemctl status {1} --no-pager --lines=10 | tail -n +2 | sed -e "s/^\(\[.*\]\)/\e[34m\1\e[0m/")\n\n\e[1;35mDescription:\e[0m\n$(systemctl show -p Description --no-pager {1} | sed -e "s/^Description=//")"' \
            --preview-window=right:50% \
            --border \
            --height=100% \
            --ansi \
            --reverse \
            --no-info \
            --query '')

        if [[ -n $service ]]; then
            local service_name
            service_name=$(echo "$service" | awk '{print $1}')

            echo -e "\n\e[32m🔧 Managing Service: \e[1;36m$service_name\e[0m\n"
            select action in "Start" "Stop" "Restart" "Status"; do
                case $action in
                    Start)
                        sudo systemctl start "$service_name" && echo -e "\e[32m✅ Service $service_name started successfully!\e[0m" || echo -e "\e[31m❌ Error: Failed to start service $service_name\e[0m"
                        ;;
                    Stop)
                        sudo systemctl stop "$service_name" && echo -e "\e[31m❌ Service $service_name stopped.\e[0m" || echo -e "\e[31m❌ Error: Failed to stop service $service_name\e[0m"
                        ;;
                    Restart)
                        sudo systemctl restart "$service_name" && echo -e "\e[33m🔄 Service $service_name restarted successfully!\e[0m" || echo -e "\e[31m❌ Error: Failed to restart service $service_name\e[0m"
                        ;;
                    Status)
                        echo -e "\n\e[1;34mService Status:\e[0m"
                        sudo systemctl status "$service_name"
                        ;;
                    *)
                        echo -e "\e[31m❌ Invalid option selected.\e[0m"
                        ;;
                esac
                break
            done
        fi
    else
        local service
        service=$(service --status-all | awk '{print $4 " " $1}' | fzf \
            --header='⚙️  Select a Service (non-systemd)' \
            --preview 'echo -e "\e[1;34mService Info:\e[0m\n\n\e[1;32mService Name:\e[0m \e[1;36m{1}\e[0m\n\n\e[1;33mStatus:\e[0m\n$(service {1} status 2>/dev/null || echo "Service not found")\n\n\e[1;35mDescription:\e[0m\n$(service {1} status 2>/dev/null | grep "Description" || echo "No description available")"' \
            --preview-window=right:50% \
            --border \
            --height=100% \
            --ansi \
            --reverse \
            --no-info \
            --query '')

        if [[ -n $service ]]; then
            local service_name
            service_name=$(echo "$service" | awk '{print $1}')

            echo -e "\n\e[32m🔧 Managing Service: \e[1;36m$service_name\e[0m\n"
            select action in "Start" "Stop" "Restart" "Status"; do
                case $action in
                    Start)
                        sudo service "$service_name" start && echo -e "\e[32m✅ Service $service_name started successfully!\e[0m" || echo -e "\e[31m❌ Error: Failed to start service $service_name\e[0m"
                        ;;
                    Stop)
                        sudo service "$service_name" stop && echo -e "\e[31m❌ Service $service_name stopped.\e[0m" || echo -e "\e[31m❌ Error: Failed to stop service $service_name\e[0m"
                        ;;
                    Restart)
                        sudo service "$service_name" restart && echo -e "\e[33m🔄 Service $service_name restarted successfully!\e[0m" || echo -e "\e[31m❌ Error: Failed to restart service $service_name\e[0m"
                        ;;
                    Status)
                        echo -e "\n\e[1;34mService Status:\e[0m"
                        sudo service "$service_name" status
                        ;;
                    *)
                        echo -e "\e[31m❌ Invalid option selected.\e[0m"
                        ;;
                esac
                break
            done
        fi
    fi
}

# ======================================================================= #

# =========================== Onefetch on CD =============================== #
run_onefetch() {
    # Check if the current directory is a Git repository
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        clear
        # Run onefetch if it's a Git repository
        onefetch
    fi
}

# Hook that runs after changing directories
chpwd() {
    run_onefetch
}
# =========================================================================== #

# ========================= Keybindings ========================== #
# Create a new Zsh line editor widget for editing
zle -N edit-widget edit  
# Bind Ctrl+E to the edit function
bindkey '^e' edit-widget  

# Create a new Zsh line editor widget for the print_file_path function
zle -N print-file-path print_file_path  
# Bind Ctrl+F to the print_file_path function
bindkey '^F' print-file-path  
# ======================================================================= #
