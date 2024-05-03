# dotfiles

## Images

### poseidon

![poseidon](./images/poseidon.jpg)

### hades

![hades](./images/hades.jpg)

### apollo

![apollo](./images/apollo.jpg)

## Usage

### *nix

```shell
./bin/dotter deploy --force --verbose
```

### *nix ARM

```shell
./bin/dotter.arm deploy --force --verbose
```

### Windows

```shell
.\bin\dotter.exe deploy --force --verbose
```

## Hosts

| hostname             | desc                  | OS                                    | machine name                  |
| -------------------- | --------------------- | ------------------------------------- | ----------------------------- |
| **poseidon**         | desktop               | Void Linux                            | HP Z240 SFF Workstation       |
| **hades**            | laptop                | Windows 10 Pro                        | HP Elitebook 840 G1           |
| **persephone**       | wsl @laptop           | Void Linux on Windows 10              | *WSL 2.0.9.0*                 |
| **zeus**             | home server host      | Proxmox VE 8.0.3                      | HP EliteDesk 800 G2 DM 65W    |
| **mnemosyne**        | backup server         | Proxmox Backup Server 3.1-4           | HP EliteDesk 800 G2 DM 65W    |
| **dionysus**         | minecraft BDS ct      | Debian GNU/Linux 12 (bookworm)        | *Proxmox VE 8.0.3*            |
| **athena**           | file server ct        | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **iris**             | irc client ct         | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **hectia**           | dashboard ct          | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **hephaestus**       | build server ct       | Alpine Linux edge                     | *Proxmox VE 8.0.3*            |
| **apollo**           | vm @desktop           | Windows 11 Pro                        | *QEMU emulator version 8.1.0* |
