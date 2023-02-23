set fish_greeting ""

set -gx TERM xterm-256color

# theme
#set -g theme_color_scheme terminal-dark
#set -g fish_prompt_pwd_dir_length 1
#set -g theme_display_user yes
#set -g theme_hide_hostname no
#set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

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
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
#set -gx MAMBA_EXE "/home/xxx/.micromamba/bin/micromamba"
#set -gx MAMBA_ROOT_PREFIX "/home/xxx/micromamba"
#$MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#if test -f /home/xxx/micromamba/bin/conda
#    eval /home/xxx/micromamba/bin/conda "shell.fish" "hook" $argv | source
#end
# <<< conda initialize <<<

# powerline-status
set fish_function_path $fish_function_path "/home/xxx/.local/lib/python3.11/site-packages/powerline/bindings/fish/"
powerline-setup