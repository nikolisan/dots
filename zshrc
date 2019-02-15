# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nick/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K CUSTOMIZATION
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_CUSTOM_SDIR="spwd"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda virtualenv context dir_writable dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs time)

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  dotenv
  git
  iwhois
  pyenv
  pylint
  python
  sudo
  vscode
  web-search
  virtualenv
  virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
if [ ! -d "$HOME/Documents/Programming/Python" ]; then
  mkdir -p $HOME/Documents/Programming/Python
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

mkcd () { mkdir -p "$@" && cd "$1"; }

export PROJECT_HOME=$HOME/Documents/Programming/Python
export PATH=/snap/bin:$PATH
export PATH=/home/nick/anaconda3/bin:$PATH
export PATH="/home/nick/miniconda3/bin:$PATH"
export PATH="/home/nick/texlive/2018/bin/x86_64-linux:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Custon functions
spwd() {
  paths=(${(s:/:)PWD})

  cur_path='/'
  cur_short_path='/'
  for directory in ${paths[@]}
  do
    cur_dir=''
    for (( i=0; i<${#directory}; i++ )); do
      cur_dir+="${directory:$i:1}"
      matching=("$cur_path"/"$cur_dir"*/)
      if [[ ${#matching[@]} -eq 1 ]]; then
        break
      fi
    done
    cur_short_path+="$cur_dir/"
    cur_path+="$directory/"
  done

  printf %q "${cur_short_path: : -1}"
  echo
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias clr="clear"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -l -a"
alias shut="shutdown 0"
