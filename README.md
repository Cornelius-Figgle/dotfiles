# dotfiles

## Images

### nightcrawler2

![nightcrawler2](./images/nightcrawler2.jpg)

### wolverine

![wolverine](./images/wolverine.jpg)

## Usage

### Install [`dotter`](https://github.com/SuperCuber/dotter):

<details>
<summary><h4>Void</h4></summary>
<pre>
# cd ~/source/void-packages
# git checkout add_dotter
./xbps-src pkg dotter
xi -y dotter
</pre>
</details>

<details>
<summary><h4>Arch</h4></summary>
<pre>
yay -S dotter-rs-bin
</pre>
</details>

<details>
<summary><h4>Windows</h4></summary>
<pre>
scoop install dotter
</pre>
</details>

<details>
<summary><h4>other</h4></summary>
<pre>
wget https://github.com/SuperCuber/dotter/releases/latest/download/dotter
sudo mv ./dotter /usr/local/bin/
sudo chmod 755 /usr/local/bin/dotter
</pre>
</details>

### Create host-specific config:

```shell
cp ./.dotter/default.toml ./.dotter/$(HOSTNAME).toml
```

### Deploy configs:

```shell
dotter deploy --force --verbose
```

## Hosts

- nightcrawler2 (desktop)
- wolverine (laptop)
- wolverine-void (wsl @laptop)
- pve1 (home server host)
- mimic4 (minecraft BDS ct)
- irc2 (irssi ct)
- win11-1 (vm @desktop)
- rosa (rpi for the [ROSA](https://github.com/Cornelius-Figgle/ROSA) project)
