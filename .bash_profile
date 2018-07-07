# -- color --
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# -- nvm ----
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# --- SVN ---
# cd www/shs
# svn co https:// --depth immediates repo
# cd repo
# svn up --set-depth infinity trunk

# -- if you must create a new branch --
# svn cp trunk branches/new-branch
# cd tags
# svn up --set-depth immediates
# cd branches/branch
# svn up
# svn commit -m 'created new branch'

alias bash="code ~/.bash_profile"

# -- sh
export PATH=$PATH:/usr/local/bin

# -- host
export PGHOST=localhost
# -- laravel
export PATH="~/.composer/vendor/bin:$PATH"
# -- pear
export PATH="/usr/local/mysql/bin:/Users/sg0301656/pear/bin/:$PATH"
# -- ruby
export PATH="$HOME/.rbenv/shims:$PATH"
# -- yarn
export PATH="$HOME/.yarn/bin:$PATH"

# -- files --
alias ll="ls -la"
alias ls="ls -GFh"

# -- apache vhosts / hosts
alias vhosts='open -a "Visual Studio Code" /Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf'
alias hosts='open -a "Visual Studio Code" /etc/hosts'

# -- xampp --
alias xampp="sudo /Applications/XAMPP/xamppfiles/xampp startapache && sudo /Applications/XAMPP/xamppfiles/xampp"
alias xrs="xampp restart"
alias xstart="xampp start"
alias xstatus="xampp status"
alias xstop="xampp stop"

# -- files:hide -- files:show --
alias files:hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias files:show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# -- cd
alias cd:wp="cd ~/www/wordpress"
alias cd:shs="cd ~/www/shs"

# -- set emergenc permissions
set_permissions () {
    # -- set local permissions for emergenc/trunk
    packages="packages"
    app_files="application/files"
    app_config="application/config"
    updates="updates"

    chmod 777 $packages
    chmod 777 $app_files
    chmod 777 $app_config
    chmod 777 $updates

    printf "chmod 777 has been run on the following directories:
    $packages
    $app_files
    $app_config
    $updates\n"
}
alias chmod777="set_permissions"


# --
# -- repo_updater
# --
update_files () {
    # -- copy local environment files from emergenc    
    repo=$1
    name=$2
    config="trunk/application/config"

    # -- If user input contains "/", remove it
    if [[ $1 =~ '/'$ ]]; then
        repo=${repo::${#repo}-1}
    fi

    # -- filepaths
    updates="$repo/trunk/updates"
    doctrine="$repo/$config/doctrine"
    update_php="$repo/$config/update.php"
    name_database="$repo/$config/$2.database.php"
    bootstrap_start="$repo/trunk/application/bootstrap/start.php"

    copy_directory () {
        if [[ ! -d $2 ]]; then
            cp -R $1 $2
            echo "Created: $2"
        else
            echo "Exists: $2"
        fi
    }

    copy_file () {
        if [[ ! -f $2 ]]; then
            cp $1 $2
            echo "Created: $2"
        else
            echo "Exists: $2"
        fi
    }
    
    if [[ -z "$2" ]]; then
        printf "Error: Did not copy database.php -> firstname.database.php
You must supply 3 arguments when running the update command
    1. update
    2. the repo you are updating
    3. your name\n\n"
    
    elif [[ ! -f "$name_database" ]]; then
        printf "<?php

return array(
    'default-connection' => 'concrete',
    'connections' => array(
        'concrete' => array(
            'driver' => 'c5_pdo_mysql',
            'server' => 'localhost',
            'database' => '$repo',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8'
        )
    )
);" >> "$repo/$config/$2.database.php"
        echo "Created: $repo/$config/$2.database.php"
    else
        echo "Exists: $repo/$config/$2.database.php"
    fi

    copy_directory "emergenc/trunk/updates" $updates
    copy_directory "emergenc/$config/doctrine" $doctrine
    copy_file "emergenc/$config/update.php" $update_php
}
alias update="update_files $1 $2"

# --
# -- cloudforge
# --
svn_co_immediates () {
    if [[ -z "$1" ]]; then
        echo 'Error: Repo Must Be Defied'
        echo 'https://app.cloudforge.com/'
    else
        svn co "$1" --depth immediates
    fi
}

set_depth_trunk () {
    if [[ -z "$1" ]]; then
        echo 'Error: Repo Must Be Defied'
        echo 'https://app.cloudforge.com/'
    else
        svn up --set-depth infinity "$1/trunk"
    fi
}

# --
# -- svn:help
# --
svn_help () {
    printf "svn:coi     co --depth immediates
svn:sdt     --set-depth infinity trunk
branch: svn up --set-depth infinity branches/branch
"
}
alias svn:help="svn_help"
alias svn:h="svn:help"
alias svn:coi="svn_co_immediates $1"
alias svn:sdt="set_depth_trunk $1"

# -- svn revert
alias svn:rev="svn revert conf/conf.php && svn revert index.php"
