# rosa

apt init & neofetch (apt)

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install -y neofetch
```

git (apt) & gh (apt-ish, from gh docs)

```bash
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install -y git gh

gh auth login
gh auth setup-git
```

tmux (apt)

```bash

```

tmux (apt), ~~dotter (manual arm build),~~ helix (ppa)

```bash
sudo apt install -y tmux

sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update && sudo apt install -y helix
```

dotfiles

```bash
cd ~/source
git clone https://github.com/Cornelius-Figgle/dotfiles && cd ./dotfiles
# copy files manually (uurgh)
```
