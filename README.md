# dotfiles

# Usage

Make sure you have [`dotter`](https://github.com/SuperCuber/dotter) installed and have created `.dotter/HOSTNAME.toml`, then:

```shell
dotter deploy --force
```

# Layout

```
dotfiles/
├── .dotter/
│   ├── include/
│   │   └── windows.toml
│   ├── NightCrawler.toml
│   ├── Quandale-Butterson.toml
│   └── global.toml
├── config/
│   └── ...
├── scripts/
│   └── ...
├── .gitignore
├── LICENSE
└── README.md
```
