# color
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# files
alias files:hide="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias files:show="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"

# bash
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
alias cd:bash="cd ~/; code .bash_profile"

# hosts
alias cd:hosts="cd ~/; code /etc/hosts"

# apache
alias mamp:conf="code /Applications/MAMP/conf/apache/httpd.conf"
alias mamp:vhosts="code /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"
alias mamp:ssl="code /Applications/MAMP/conf/apache/extra/httpd-ssl.conf"

# composer
alias composer="php /usr/local/bin/composer.phar"

# rbenv
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# nvm
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# react-native
alias rn:build="sh ~/code/bash/react-native/build.sh"

# wordpress
export PATH="/Applications/MAMP/bin/php/php7.3.8/bin:$PATH"
export PATH="$PATH:/Applications/MAMP/Library/bin"
wp-create () {
    mkdir $1;
    cd $1;
    wp core download;
    wp core config --dbname="$1" --dbuser='root' --dbpass='root';
    wp core install --url="http://$1.localhost" --title=$1 --admin_user="root" --admin_password="root" --admin_email="brandnpatterson@gmail.com";

    cd wp-content/themes;
    git clone https://github.com/brandnpatterson/_s.git;
    cd _s && rm -rf .git; cd ..;
    mv _s $1;
    cd ../..;
}

alias cd:wp="cd ~/code/htdocs/wp"
alias wp-create="wp-create $1"
