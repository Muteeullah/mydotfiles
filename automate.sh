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
    sudo apt install zsh git curl wget -y
    
}

function common_cmd(){
    padding "Installing Oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    
    
    padding "Downloading Themes"
    git clone --depth 1 https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k && git pull
    git clone --depth 1 https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions && git pull
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git pull
    git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull
    
   
    if [ "$(uname)" == "Darwin" ]; then
    #Add your own fonts here MACOS

    cd ~/Library/Fonts && { curl -O 'https://github.com/powerline/fonts/blob/master/FiraMono/FuraMono-Regular%20Powerline.otf' ; cd -; }
    
    else

     #Add your own fonts here LINUX

     wget -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
     wget -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
     
     #gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 11"

    fi
    

    if [ "$(uname)" == "Darwin" ]; then
    /usr/bin/sed -i -e 's:.*ZSH_THEME.*:ZSH_THEME="powerlevel9k/powerlevel9k":' ~/.zshrc
    else
    /bin/sed -i -e 's:.*ZSH_THEME.*:ZSH_THEME="powerlevel9k/powerlevel9k":' ~/.zshrc
    fi

    padding "Add and replace these lines in .zshrc"
    padding

    echo -e "${YELLOW}
    plugins=( git bundler dotenv osx rake rbenv ruby zsh-completions zsh-autosuggestions )

    autoload -U compinit && compinit

    ${RED}
    Please run the below command and then logout to see changes
    
    $ chsh -s $(which zsh)
    
    ${NC}
    "
    chsh -s $(which zsh)
    
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
