#!/bin/bash

#HouseKeeping
YELLOW='\e\033[1;33m'
RED='\e\033[1;31m'
NC='\e\033[0m'
function padding()
{
    pad=$(printf '%*s' 25 "" | tr ' ' '=')
    echo -e "${YELLOW} $pad $@ $pad ${NC}"
    
}

#Functions

function linux_command(){
    padding "Installing ZSH"
    sudo apt update -y
    sudo apt install git curl -y
    sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
    curl https://pyenv.run | bash
}

function common_cmd(){
    
    #Adding env for pyenv
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
     
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    #Installing specific python-version
    pyenv install 3.7.4
    pyenv virtualenv 3.7.4 actenv

    # echo 'alias actenv = "pyenv activate actenv"' >> ~/.zshrc
    # echo 'alias deactivate = "source deactivate"' >> ~/.zshrc
    # sudo chown -R $whoami:root ~/.pyenv
}

# OS Checking and Main
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform 
    padding "Detected Mac OS"
    common_cmd   
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    padding "Detected Linux"
    linux_command
    common_cmd
fi
