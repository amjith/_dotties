# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ "$OSTYPE" != "linux-gnu" ]] then
	plugins=(git autojump brew osx python django)
else
	plugins=(git autojump python django) 
fi

source $ZSH/oh-my-zsh.sh
source $HOME/_dotties/zsh_functions

# Customize to your needs...
if [[ "${OSTYPE}" != "linux-gnu" ]] then
	export PATH=$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
	source /usr/local/bin/virtualenvwrapper.sh
else
	export PATH=/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/lib/qt4/bin:/usr/NX/bin:/usr/NX/bin:/home/amjith/bin:/opt/google_appengine:/usr/NX/bin:/home/amjith/bin:/usr/NX/bin
	source /usr/bin/virtualenvwrapper.sh
fi
