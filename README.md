# dotfiles

# Usage

Install [`dotter`](https://github.com/SuperCuber/dotter):

| Void | Arch | Windows | other |
|---|---|---|---|
| # cd ~/source/void-packages<br># git checkout add_dotter<br>./xbps-src pkg dotter<br>xi dotter | yay -S dotter-rs | scoop install dotter | wget https://github.com/SuperCuber/dotter/releases/latest/download/dotter<br>sudo mv ./dotter /usr/local/bin/ |

Create host-specific config:

```shell
cp ./.dotter/default.toml ./.dotter/$(HOSTNAME).toml
```

Deploy configs:

```shell
dotter deploy --force
```

# Layout

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
