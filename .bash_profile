################
## Brew stuff ##
################

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

####################
## Python related ##
####################

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# `gpip` used to install global packages with pip
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Virtualenvwrapper 
export WORKON_HOME=$HOME/.virtualenvs

# Enable virtualenvwrapper stuff
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Unable to locate virtualenvwrapper.sh -- Please check your .bash_profile"
fi
