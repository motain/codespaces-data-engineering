# Intro
The devcontainer from OneFootball data engineering. Doom Emacs already configured for Python development.
* https://www.linkedin.com/pulse/reality-vs-expectations-how-we-have-solved-problem-hiring-miorin-dcpcf

# Changelog
## V1.1
* Faster post-create container. Now doom emacs is first sync during the build time.
* Zellij new bindings like tmux to avoid conflict with doom emacs. Use wezterm SendKey to remap to something more convinient.
* Zellij more real estate by removing the status plugin at the bottom.
* Better starship configuration.
* Smaller atuin interface. The full screen version was losing the context.
* Fix the umask madness of codespaces.
* fish as a vterm shell.
* Doom Emacs
  * Disable workspaces
  * User ranger + icons instead of dired
  * Enable lsp and tree-sitter
  * Enable OSC 52
  * Add python support
  * Isolated emacs per developer.
* Fix cursor in fish. Now you have line for insert and block for command like vim and emacs
* Workaround for the change directory in fish. See https://github.com/zellij-org/zellij/issues/3184
* 
## V1.0
* Initial import

# Setup
``` sh
# locally
gh cs create -R motain/codespaces-data-engineering -m basicLinux32gb
gh cs ssh
# inside the container
zellij attach --create <name of the session>
emacs
# check the creation of the devcontainer for problems
tail -f /workspaces/.codespaces/.persistedshare/creation.log
# Vscode development
gh cs code
```

# Sharing your terminal with multiple cursor
Repeat all the steps above till zellij.
* https://zellij.dev/news/multiplayer-sessions/

# Development
``` sh
devcontainer build --workspace-folder .
devcontainer up --workspace-folder .
```

```
Co-authored-by: Alberto Miorin <109069886+alberto-of@users.noreply.github.com>
Co-authored-by: Valery Lavrentiev <valery.lavrentiev@onefootball.com>
Co-authored-by: Marlon Rozindo <151554259+felixmarlon@users.noreply.github.com>
```
