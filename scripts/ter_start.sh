
#!/bin/bash

tmux new -s MainTer -d
tmux send-keys -t MainTer:0.0 "/home/max/srv/current/Linux/TerrariaServer.bin* -config /home/max/.local/share/Terraria/Configs/mild_mischief.txt" ENTER
tmux a
