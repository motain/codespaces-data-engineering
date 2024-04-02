# fix permissions in codespace after every run
sudo chmod g+w /tmp
sudo setfacl -b /tmp

/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
# micromamba shell hook --shell fish | source
starship init fish | source
zoxide init fish | source
direnv hook fish | source
atuin init fish | source
fish_vi_key_bindings
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/google-cloud-sdk/bin

set -gx EDITOR happy-emacs
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

# # export AWS env variables from default
# set -gx AWS_ACCESS_KEY_ID $(aws configure get default.aws_access_key_id)
# set -gx AWS_SECRET_ACCESS_KEY $(aws configure get default.aws_secret_access_key)
# set -gx AWS_SESSION_TOKEN $(aws configure get default.aws_session_token)
# set -gx AWS_DEFAULT_REGION $(aws configure get default.region)

# Micromamba config
eval "$(micromamba shell hook --shell fish)"

# https://the.exa.website/
alias ls=ls
alias ll="ls -lh"
alias l="ls -la"
alias rt="ls -l --sort newest"
alias u="cd .."
alias k=kubectl

function zc
    cd (fd --type d | fzf)
end

function zw
    cd (fd . --type d /workspaces | fzf)
end

function zo
    emacs (fd --type f | fzf)
end

function ze
    set items ALBERTO MARLON VALERY FACUNDO
    set config (printf "%s\n" $items | fzf --prompt="Start Zellij" --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    end
    zellij attach --create $config
end

if status is-interactive
    set server_name "$ZELLIJ_SESSION_NAME"
    test -z "$ZELLIJ_SESSION_NAME"; and set server_name "server"
    set emacs_exp '(with-current-buffer (window-buffer (selected-window)) (projectile-project-root))'
    set emacs_dir (emacsclient -a 'echo' --eval "$emacs_exp" -s /tmp/emacs1000/"$server_name" 2> /dev/null)
    if test "$emacs_dir" != "nil"
        if test "$emacs_dir" != "$emacs_exp"
            cd (echo $emacs_dir | jq -r)
        end
    end
end
