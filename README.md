# dotfiles

# Usage

Make sure you have [`dotter`](https://github.com/SuperCuber/dotter) installed and have created `.dotter/$(HOSTNAME).toml`, then:

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
│   ├── NightCrawler.toml
│   ├── Quandale-Butterson.toml
│   ├── arnold-krimmler.toml
│   ├── global.toml
│   ├── mimic4.toml
│   └── rosa.toml
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
└── README.md
```
