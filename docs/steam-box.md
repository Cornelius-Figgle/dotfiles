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
lxc shell steam-box  # root

passwd  # set root password
useradd -G wheel -m -s /bin/bash max  # create our user
passwd max  # set user password
visudo  # allow members of %wheel to run any command

pacman -S helix
hx /etc/pacman.conf  # enable multilib repo
pacman -Syu

mkdir /mnt/wayland1  # setup socket dir

exit
```

lxc profiles for gpu & compositor passthrough (wayland & xwayland)

```shell
lxc stop steam-box
lxc profile create wayland-gpu
lxc profile edit wayland-gpu < """config: {}
description: config for gpu passthrough
devices:
  Waylandsocket:
    bind: container
    connect: unix:/run/user/1000/wayland-1
    gid: "1000"
    listen: unix:/mnt/wayland1/wayland-0
    mode: "0777"
    security.gid: "1000"
    security.uid: "1000"
    type: proxy
    uid: "1000"
  XWaylandsocket:
    bind: container
    connect: unix:/tmp/.X11-unix/X0
    gid: "1000"
    listen: unix:/mnt/wayland1/X1
    mode: "0777"
    security.gid: "1000"
    security.uid: "1000"
    type: proxy
    uid: "1000"
  eth0:
    name: eth0
    nictype: bridged
    parent: lxdbr0
    type: nic
  root:
    path: /
    pool: default
    type: disk
name: wayland-gpu
used_by:
"""
lxc profile add steam-box wayland-gpu  # add profile for compositor passthrough
lxc start steam-box
```

install programs (pacman & yay)

```shell
lxc shell steam-box  # will login as root
su max  # change user
cd  # change to home dir

sudo pacman -S git github-cli neofetch helix tmux steam  # install programs
mkdir source && cd source
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
sudo pacman -S --needed base-devel  # fix missing packages
makepkg -si
cd
yay -Syu
yay -S cpu-x dotter-rs-bin proton-ge-custom  # install aur programs
```

dotfiles

```shell
gh auth login  # use token
gh auth setup-git

git clone https://github.com/Cornelius-Figgle/dotfiles
cd ./dotfiles
dotter deploy --force --verbose  # deploy dotfiles
sudo cp ./config/lxc_gpu_socket_linker.sh /usr/local/bin/
sudo chmod u+x /usr/local/bin//lxc_gpu_socket_linker.sh
cd
exec bash

echo """[Unit]
Description=links compositor sockets for wayland and xwayland
[Service]
ExecStart=/usr/local/bin//lxc_gpu_socket_linker.sh
[Install]
WantedBy=multi-user.target""" | sudo tee /etc/systemd/system/lxc_gpu_socket_linker.service > /dev/null

sudo systemctl start lxc_gpu_socket_linker
sudo systemctl enable lxc_gpu_socket_linker
sudo systemctl stop lxc_gpu_socket_linker

exit  # drops to root
exit  # drops to host

lxc stop steam-box
lxc start steam-box
lxc shell steam box
su max
cd
```
