# dotfiles

## Images

### nightcrawler2

![nightcrawler2](./images/nightcrawler2.jpg)

### wolverine

![wolverine](./images/wolverine.jpg)

## Usage

### Install [`dotter`](https://github.com/SuperCuber/dotter):

<table>
  <tr>
    <td>
      <details><summary><h4>Void</h4></summary><pre># cd ~/source/void-packages<br># git checkout add_dotter<br>./xbps-src pkg dotter<br>xi -y dotter</pre></details>
    </td>
    <td>
      <details><summary><h4>Arch</h4></summary><pre>yay -S dotter-rs-bin</pre></details>
    </td>
    <td>
      <details><summary><h4>Windows</h4></summary><pre>scoop install dotter</pre></details>
    </td>
    <td>
      <details><summary><h4>Alpine</h4></summary><pre>apk add wget<br>wget https://github.com/SuperCuber/dotter/releases/latest/download/dotter<br>mv ./dotter /usr/local/bin/<br>chmod 755 /usr/local/bin/dotter</pre></details>
    </td>
    <td>
      <details><summary><h4><i>other</i></h4></summary><pre>wget https://github.com/SuperCuber/dotter/releases/latest/download/dotter<br>sudo mv ./dotter /usr/local/bin/<br>sudo chmod 755 /usr/local/bin/dotter</pre></details>
    </td>
  </tr>
</table>

### Create host-specific config:

```shell
cp ./.dotter/default.toml ./.dotter/$(HOSTNAME).toml
```

### Deploy configs:

```shell
dotter deploy --force --verbose
```

## Hosts

- nightcrawler2 (Void - desktop)
- wolverine (Win10 - laptop)
- wolverine-void (Void - wsl @laptop)
- pve1 (Proxmox - home server host)
- mimic5 (Debian - minecraft BDS ct)
- irc2 (Alpine - irssi ct)
- win11-1 (Win11 - vm @desktop)
- steam-box-1 (Arch - ct @desktop)
- rosa (Raspbian - rpi for the [ROSA](https://github.com/Cornelius-Figgle/ROSA) project)
