# -- color --
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# -- nvm ----
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# --- SVN ---
# cd www
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

# -- host
export PGHOST=localhost
# -- ruby
export PATH="$HOME/.rbenv/shims:$PATH"
# -- yarn
export PATH="$HOME/.yarn/bin:$PATH"

# -- alias --
alias ans="atom . && npm start"
alias ll="ls -la"
alias ls="ls -GFh"
alias ans="atom . & npm start"

# -- xampp --
alias xstart="sudo /Applications/XAMPP/xamppfiles/xampp startapache && sudo /Applications/XAMPP/xamppfiles/xampp startmysql && sudo /Applications/XAMPP/xamppfiles/xampp startftp"
alias xstatus="sudo /Applications/XAMPP/xamppfiles/xampp status"
alias xstop="sudo /Applications/XAMPP/xamppfiles/xampp stopapache && sudo /Applications/XAMPP/xamppfiles/xampp stopmysql && sudo /Applications/XAMPP/xamppfiles/xampp stopftp"
alias xrestart="sudo /Applications/XAMPP/xamppfiles/xampp restartapache && sudo /Applications/XAMPP/xamppfiles/xampp restart"

# -- files:hide -- files:show --
alias files:hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias files:show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# -- git
alias cd:js="cd git/js"
alias cd:node="cd git/node"
alias cd:php="cd git/php"
alias cd:react="cd git/react"
alias cd:ruby="cd git/ruby"
alias cd:vue="cd git/vue"

# -- idiosync
alias cd:idiosync="cd:ruby && cd idiosync && rails s"
alias cd:idiosync-ui="cd:react && cd idiosync-ui && npm start"
