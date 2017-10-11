# -- Colors ! ----
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# -------
# Aliases
# -------
alias ll="ls -la"
alias ls="ls -GFh"
alias ans="atom . & npm start"

# -- code
alias cd:code="cd Documents/Code"
alias cd:node="cd Documents/Code/node"
alias cd:php="cd Documents/Code/php"
alias cd:react="cd Documents/Code/react"
alias cd:ruby="cd Documents/Code/ruby"
alias cd:sb="cd Documents/Code/scotch-box"
alias cd:vue="cd Documents/Code/vue"

# -- idiosync
alias cd:idiosync="cd:ruby && cd idiosync && rails s"
alias cd:idiosync-ui="cd:react && cd idiosync-ui && npm start
"

# - rails -- rspec
alias rspec="bundle exec rspec"

# -- nvm ----
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# -- ruby
export PATH="$HOME/.rbenv/shims:$PATH"

 # -- yarn
 export PATH="$HOME/.yarn/bin:$PATH"

# -- host
 export PGHOST=localhost
