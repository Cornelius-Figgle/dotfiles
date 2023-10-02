# rosa

apt init & neofetch (apt)

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install -y neofetch
```

git (apt) & gh (apt-ish, from gh docs)

```bash
type -p curl >/dev/null || (sudo apt update && sudo apt install -y curl)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install -y git gh

gh auth login
gh auth setup-git
```

tmux (apt), ~~dotter (manual arm build),~~ helix (gh releases)

```bash
sudo apt install -y tmux

mkdir ~/source && cd ~/source

gh release -R https://github.com/helix-editor/helix download -p helix-*-aarch64-linux.tar.xz
xz -d ./helix-*-aarch64-linux.tar.xz -T$(nproc) -v
tar -xvf ./helix-*-aarch64-linux.tar
sudo cp ./helix-*-aarch64-linux/hx /usr/local/bin/
```

dotfiles

```bash
cd ~/source
git clone https://github.com/Cornelius-Figgle/dotfiles && cd ./dotfiles

# copy files manually (uurgh)
cp -r ./config/helix/* ~/.config/helix/
hx ~/.config/helix/config.toml  # L8 replace template values
cp ./config/tmux/config.tmux ~/.tmux.conf
cp ./config/tmux/silent-tmux.tmux ~/.silent-tmux.conf
cp ./config/bash/config.sh ~/.bashrc
cp ./config/git/config.ini ~/.gitconfig
hx ~/.gitconfig  # L2,7,10 replace template values
mkdir ~/.config/neofetch && cp ./config/neofetch/config.conf ~/.config/neofetch/config.conf
hx ~/.config/neofetch/config.conf  # L345 replace template values

logout  # reconnect ssh
```
