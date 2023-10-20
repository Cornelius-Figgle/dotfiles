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

exit
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
yay -Syu
yay -S cpu-x dotter-rs-bin  # install aur programs
```

# dotfiles

```shell
gh auth login  # use token
gh auth setup-git

git clone https://github.com/Cornelius-Figgle/dotfiles
cd ./dotfiles
dotter deploy --force --verbose  # deploy dotfiles
exec bash
```
