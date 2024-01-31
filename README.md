# dotfiles

## Images

### poseidon

![poseidon](./images/poseidon.jpg)

### hades

![hades](./images/hades.jpg)

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
      <details><summary><h4><i>other</i></h4></summary><pre>wget https://github.com/SuperCuber/dotter/releases/download/v0.13.0/dotter<br>sudo mv ./dotter /usr/local/bin/<br>sudo chmod 755 /usr/local/bin/dotter</pre></details>
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

| hostname             | desc                  | OS                                    | machine name                  |
| -------------------- | --------------------- | ------------------------------------- | ----------------------------- |
| **poseidon**         | desktop               | Void Linux                            | HP Z240 SFF Workstation       |
| **hades**            | laptop                | Windows 10 Pro                        | HP Elitebook 840 G1           |
| **persephone**       | wsl @laptop           | Void Linux on Windows 10              | *WSL 2.0.9.0*                 |
| **zeus**             | home server host      | Proxmox VE 8.0.3                      | HP EliteDesk 800 G2 DM 65W    |
| **dionysus**         | minecraft BDS ct      | Debian GNU/Linux 12 (bookworm)        | *Proxmox VE 8.0.3*            |
| **athena**           | file server ct        | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **iris**             | irc client ct         | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **hectia**           | dashboard ct          | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **apollo**           | vm @desktop           | Windows 11 Pro                        | *QEMU emulator version 8.1.0* |
| **rosa**             | rpi for ROSA project  | Raspberry Pi OS Lite 12 (bookworm)    | Raspberry Pi Zero 2 W         |
