/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
# micromamba shell hook --shell fish | source
starship init fish | source
zoxide init fish | source
direnv hook fish | source
atuin init fish | source
fish_vi_key_bindings
fish_add_path $HOME/.emacs.d/bin

# set -gx EDITOR "emacsclient -a '' -t"
set -gx EDITOR "emacs"
alias emacs=$EDITOR
set -gx POETRY_VIRTUALENVS_IN_PROJECT true
set -g fish_greeting
set -gx COLORTERM truecolor

# https://the.exa.website/
alias ls=ls
alias ll="ls -lh"
alias l="ls -la"
alias rt="ls -l --sort newest"
alias u="cd .."
