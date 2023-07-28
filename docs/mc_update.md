# Updating Minecraft Server

- Commands here use sample version numbers so these should be changed when updating
- Also another reminder that symlinks should use absolute paths as much as possible

## Closing Server

Connect to server

```pwsh
# pwsh
ssh max@192.168.0.12
```

Tell ppl to get off and close the server, then close tmux window

```bash
tmux a -t MainMc
say Server needs an update so please save your games
list  # wait until no one is online
stop
# ctrl-b, x, y
```

## Downloading Update Files

Copy the latest Ubuntu url from Minecraft's website

[https://www.minecraft.net/en-us/download/server/bedrock](https://www.minecraft.net/en-us/download/server/bedrock)

Cd into Minecraft folder and download the zip from the url from above

```bash
cd ~/mc
wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.63.01.zip
# url from above, or edit version in url
```

# Unzip update files into the version folder

```bash
unzip ../bedrock-server-1.19.63.01.zip -d ./1196301
```

## Coping Configs & Data Files From Old Version

Copy worlds, permissions, whitelist and setup files across

```bash
cd ./1196301
cp -r ../current/worlds/ .
cp ../current/permissions.json .
cp ../current/allowlist.json .
cp ../current/server.properties .
```

## Setting Up Behaviour Packs

Find newest behaviour file for player (note American spelling)

```bash
find ../current/behavior_packs/ -iname player.json
# find the newest version in the list (will not be sorted)
```

Edit the player file from dir above

```bash
nano +116,24 ../current/behavior_packs/vanilla_1.19.50/entities/player.json
# change the second line of the `minecraft:nameable` category to be `false` (as shown below)
```

```plaintext
      "minecraft:nameable": {
        "always_show": false,
        "allow_name_tag_renaming": false
      },
```

## Update The Symlinks

Cd back to minecraft folder

```bash
cd ~/mc
```

Remove the previous symlink

```bash
rm ./current
```

Add new symlink

```bash
# ln -sd <target> <link>
ln -sd /home/max/mc/1196301/ /home/max/mc/current
```

## Restarting Server

Restart the server

```bash
cd ~
bash ~/source/dotfiles/scripts/mc_start.sh
```

If the `mc_start.sh` is not available, use the following:

```bash
tmux new -s MainMc -d
tmux send-keys -t MainMc:0.0 "cd /home/max/mc/current" ENTER
tmux send-keys -t MainMc:0.0 "/home/max/mc/current/bedrock_server"  ENTER
tmux a
```

Tell anyone that was online at the start that server is up now :)
