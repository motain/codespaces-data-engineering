/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
# micromamba shell hook --shell fish | source
starship init fish | source
zoxide init fish | source
direnv hook fish | source
atuin init fish | source
fish_vi_key_bindings
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/google-cloud-sdk/bin

set -gx EDITOR "emacsclient -a '' -t -s $HOME/.emacs.d/$ZELLIJ_SESSION_NAME/server"
alias emacs=$EDITOR
set -gx POETRY_VIRTUALENVS_IN_PROJECT true
set -g fish_greeting
set -gx COLORTERM truecolor
set -gx TZ 'Europe/Berlin'

# cursor style like vim
set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block

# https://the.exa.website/
alias ls=ls
alias ll="ls -lh"
alias l="ls -la"
alias rt="ls -l --sort newest"
alias u="cd .."

function zc
    cd (fd --type d | fzf)
end

function zw
    cd (fd . --type d /workspaces | fzf)
end

function zo
    emacs (fd --type f | fzf)
end

set emacs_exp '(with-current-buffer (window-buffer (selected-window)) (projectile-project-root))'
set emacs_dir (emacsclient -a 'echo' --eval "$emacs_exp" -s $HOME/.emacs.d/$ZELLIJ_SESSION_NAME/server 2> /dev/null)
if test "$emacs_dir" != "nil"
    if test "$emacs_dir" != "$emacs_exp"
        cd (echo $emacs_dir | jq -r)
    end
end
