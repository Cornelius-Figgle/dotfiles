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

tmux (apt), ~~dotter (manual arm build),~~ helix (gh releases)

```bash
sudo apt install -y tmux

gh release -R https://github.com/helix-editor/helix download -p helix-*-aarch64-linux.tar.xz
xz -d helix-*-aarch64-linux.tar.xz -T$(nproc) -v
tar -xvf helix-*-aarch64-linux.tar
sudo cp ./helix-*-aarch64-linux/hx /usr/local/bin/
```

dotfiles

```bash
cd ~/source
git clone https://github.com/Cornelius-Figgle/dotfiles && cd ./dotfiles
# copy files manually (uurgh)
```
