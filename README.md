# Intro
The devcontainer from OneFootball data engineering. Doom Emacs already configured for Python development.
* https://www.linkedin.com/pulse/reality-vs-expectations-how-we-have-solved-problem-hiring-miorin-dcpcf

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
