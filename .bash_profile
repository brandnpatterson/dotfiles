# -- Colors ! ----
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# -------
# Aliases
# -------
alias ll="ls -la"
alias ls="ls -GFh"
alias pomg="push origin master && git checkout gh-pages && git merge master && git push origin gh-pages && git checkout master"
alias ans="atom . & npm start"

# -- nvm ----
export NVM_DIR=~/.nvm
 .  $(brew --prefix nvm)/nvm.sh

 # -- ruby
 export PATH="$HOME/.rbenv/shims:$PATH"

 # -- yarn
 export PATH="$HOME/.yarn/bin:$PATH"

# -- perlbrew ----
source ~/perl5/perlbrew/etc/bashrc
