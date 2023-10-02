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
sudo apt install -y tmux
```

dotter (manual build bc arm), helix (ppa), tmux (apt)

```bash
tmux  # open `top` or similar in a seperate pane
export RUSTUP_UNPACK_RAM=134217728  # 128M ram
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

mkdir source && cd source

cargo fetch --locked --target "aarch64-unknown-linux-gnu"
cargo build --release --frozen
mv ./target/release/dotter /usr/local/bin/

sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update && sudo apt install -y helix
```

dotfiles

```bash
cd ~/source
git clone https://github.com/Cornelius-Figgle/dotfiles && cd ./dotfiles
dotter deploy --force
```
