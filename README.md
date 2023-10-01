# dotfiles

## Usage

### Install [`dotter`](https://github.com/SuperCuber/dotter):

#### Void

```bash
# cd ~/source/void-packages
# git checkout add_dotter
./xbps-src pkg dotter
xi -y dotter
```

#### Arch

```bash
yay -S dotter-rs-bin
```

#### Windows

```pwsh
scoop install dotter
```

#### other

```shell
wget https://github.com/SuperCuber/dotter/releases/latest/download/dotter
sudo mv ./dotter /usr/local/bin/
sudo chmod 755 /usr/local/bin/dotter
```

### Create host-specific config:

```shell
cp ./.dotter/default.toml ./.dotter/$(HOSTNAME).toml
```

### Deploy configs:

```shell
dotter deploy --force
```

## Layout

```
dotfiles/
├── .dotter/
│   ├── include/
│   │   └── windows.toml
│   ├── scripts/
│   │   └── pwsh_deploy.ps1
│   ├── default.toml
│   ├── global.toml
│   ├── irc1.toml
│   ├── mimic4.toml
│   ├── nightcrawler2.toml
│   ├── rosa.toml
│   ├── wolverine-void.toml
│   └── wolverine.toml
├── config/
│   └── ...
├── docs/
│   └── ...
├── scripts/
│   └── ...
├── wallpapers/
│   └── ...
├── .gitignore
├── LICENSE
├── README.md
└── pfp.png
```
