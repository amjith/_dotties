# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gentoo"
#ZSH_THEME="tjkirch"
#ZSH_THEME="agnoster"
ZSH_THEME="apple"
export TERM=xterm-256color
#ZSH_THEME="norm"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ "${OSTYPE}" != "linux-gnu" ]] then
	plugins=(git autojump brew pip osx python django)
else
	plugins=(git autojump compleat pip python django) 
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_functions
source $HOME/.zsh_aliases

# Customize to your needs...
if [[ "${OSTYPE}" != "linux-gnu" ]] then
	export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
	source /usr/local/bin/virtualenvwrapper.sh
else
	export PATH=/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/lib/qt4/bin:/usr/NX/bin:/usr/NX/bin:/home/amjith/bin:/opt/google_appengine:/usr/NX/bin:/home/amjith/bin:/usr/NX/bin
	source /usr/bin/virtualenvwrapper.sh
fi

# Set editor to a command-line mvim 
EDITOR=('mvim' '-v')
export EDITOR


# rbenv init
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Make 'less' powerful. This lets less list files inside tar.gz
LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
export LESSOPEN

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

# This allows interactive comments on command line.
setopt interactivecomments

ulimit -n 4096

# Maven settings
#export M2_HOME=$HOME/maven-3.2.2
#export M2=$M2_HOME/bin
#export PATH=$PATH:$M2

# Golang settings
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Docker boot2docker
export DOCKER_CERT_PATH=/Users/amjith/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export HOMEBREW_EDITOR='mvim -v'
