# devtools

Tree

```
TODO @lemigu : snapshot of filetree, with comments on what each folder contains ??
```

---

TODO List:
- utility scripts / binaries / cli tools inside `tools` folder
- Dockerfiles inside `containers` folder, containing pre-packaged container for Go/Python development with my `tools` already preconfigured
- `setmeup.sh` script at the root for installing and configuring all `tools` and dependencies locally on the caller system
- pipelines for building and releasing the containers
- script for opening current directory inside a development container, mounting the directory in it, as well as mounting ssh keys and (ideally) inheriting gitconfig as well
- font setup?
- specific terminal emulator setup?
- ~/.config folder for relevant apps


- `devenv` CLI
  - `devenv create <name> [-p path_to_mount]<optional>` - creates a headless (?) Docker container devenv with the mounted directory
  - `devenv list` - shows active/inactive devenvs (aka containers)
  - `devenv connect <name>` - connects to a devenv (aka container)
  - `devenv start <name>` - starts and connects to the specified devenv (aka container)
  - `devenv stop <name>` - stops the specified devenv (aka container)
  - `devenv destroy <name>` - destroys the specified devenv (aka container)


Dependencies so far:
- `awk`, `cut`, `jq`
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)
- [yq](https://github.com/mikefarah/yq)
- [gitui](https://github.com/gitui-org/gitui)
- [tmux](https://github.com/tmux/tmux)
- [oh-my-posh](https://ohmyposh.dev/docs/)


Aliases:
- `mff` -> micro open find file
- `mfs` -> micro open find string
- `gg` -> gitui
  - might need something like this `alias 'gitui'='eval $(ssh-agent) && ssh-add ~/.ssh/id_ed25519 && gitui'`


Finding a file and opening it in micro: 
```bash
micro $(fzf --style full --preview 'fzf-preview.sh {}')
```

Finding files with a given content, and opening them in micro:
```bash
micro $(rg --no-heading --line-number "bash" | cut -d: -f1,2 | fzf --style full --preview 'fzf-preview.sh {}' | awk -F: '{print "+"$2" "$1}')
```

Going to function definition:
```
micro -plugin install lsp
go install golang.org/x/tools/gopls@latest

python3 -m pip install --user jedi
python3 -m pip install --user python-lsp-server

Then (Alt + d) to go to function definition
Then (Alt + r) to find references

Note: For Go, it works best if there is a go.work file (go work init <root>)
^- actually, might not be true, probably was user error :)

Note: For Python, ensure Location in output of `python3 -m pip show python-lsp-server` is in PATH 
```

Format JSON:
```
CTRL + e -> jsonfmt (my custom plugin, leveraging `yq`)
```


TMUX:
- (start it on bashrc)
- `CTRL+b c` - create new window
- `CTRL+b <number>` - to swap between windows
- `CTRL+b %` - split side by side
- `CTRL+b "` - split top and bottom
- `CTRL+b o` - swapping between panes (can use arrow keys instead of `o` as well)
- `CTRL+b $` - rename session
- `CTRL+b ,` - rename pane
- `[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}` - on bashrc to always start tmux
