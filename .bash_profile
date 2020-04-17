# nvm
export NVM_DIR=~/.nvm
  .  $(brew --prefix nvm)/nvm.sh

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"

# remove branches
alias rm:branches="git branch | grep -v "master" | xargs git branch -D"

# color
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \[\033[33;1m\]\w\[\033[m\] \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# files
alias files:hide="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias files:show="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# apache
alias mamp:apache="code /Applications/MAMP/conf/apache/httpd.conf"
alias mamp:vhosts="code /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"
alias mamp:ssl="code /Applications/MAMP/conf/apache/extra/httpd-ssl.conf"

# nginx
alias mamp:nginx="code /Applications/MAMP/conf/nginx/nginx.conf"

# django
alias rs="./manage.py runserver"
alias ve="source env/bin/activate"

# react-native
alias rn:build="sh ~/code/bash/react-native/build.sh"

# composer
alias composer="php /usr/local/bin/composer.phar"

# wordpress
export PATH="/Applications/MAMP/bin/php/php7.3.8/bin:$PATH"
export PATH="$PATH:/Applications/MAMP/Library/bin"

wp_create() {
    mkdir $1;
    cd $1;
    wp core download;
    wp core config --dbname="$1" --dbuser='root' --dbpass='root';
    wp core install --url="http://$1.localhost" --title=$1 --admin_user="root" --admin_password="root" --admin_email="brandnpatterson@gmail.com";

    cd wp-content/themes;
    git clone https://github.com/brandnpatterson/_s_lite.git;
    cd _s_lite && rm -rf .git; cd ..;
    mv _s_lite $1;
    cd ../..;
}

alias wp-create="wp_create $1"
