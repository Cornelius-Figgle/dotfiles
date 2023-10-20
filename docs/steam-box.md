# steam in lxc (arch guest, void host)

install lxd in host

```shell
sudo xbps-install -S lxd
sudo ln -s /etc/sv/lxd /var/service/  # start service
sudo usermod -aG lxd max  # add self to group
logout  # needed to apply group changes
```

setup lxd

```shell
lxd init  # use defaults mostly
```

create container

```shell
lxc launch images:archlinux/current/amd64 steam-box
```

setup container

```shell
lxc shell steam-box  # will login as root

passwd  # set root password
useradd -G wheel -m -s /bin/bash max  # create our user
passwd max  # set user password
visudo  # allow members of %wheel to run any command

pacman -S vim
vim /etc/pacman.conf  # enable multilib repo
pacman -Syu
```
