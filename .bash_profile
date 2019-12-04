#-- CD --#
# wordpress
alias cd:wp="cd ~/code/htdocs/wp"
# muckrack
alias cd:mr="cd ~/code/django/muckrack; workon muckrack"
# runebear
alias cd:rb="cd ~/code/htdocs/wp/runebear/wp-content/themes/runebear"
#  go-edit-graphics-app
alias cd:ge="cd ~/code/node/go-edit-graphics-app"
# my-upventur
alias cd:uv="cd ~/code/react-native/my-upventur/client"

# color
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \[\033[33;1m\]\w\[\033[m\] \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# files
alias files:hide="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias files:show="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"

# bash
alias cd:bash="cd ~/; code .bash_profile"

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

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
    git clone https://github.com/brandnpatterson/_s_lite.git;
    cd _s_lite && rm -rf .git; cd ..;
    mv _s_lite $1;
    cd ../..;
}

alias wp-create="wp-create $1"
