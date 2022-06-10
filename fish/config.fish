set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias vi nvim
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH ~/.nodebrew/current/bin $PATH
set -gx PATH node_modules/.bin $PATH

# Goenv
set -gx GOENV_ROOT $HOME/.goenv
set -gx PATH $GOENV_ROOT/bin $PATH
set -gx PATH $GOENV_ROOT/shims $PATH
goenv init - | source
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Flutter
set -gx PATH $HOME/flutter/bin $PATH

# Rust
set -gx PATH ~/.cargo/bin $PATH

# Pyenv
set -x PYENV_ROOT $HOME/.pyenv/shims
set -x PATH $PYENV_ROOT $PATH
set -x PIPENV_PYTHON $PYENV_ROOT/python
pyenv init --path | source
pyenv init - | source

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

