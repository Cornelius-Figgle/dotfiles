#!/bin/bash

tmux new -s MainMc -d
tmux send-keys -t MainMc:1.1 "cd /home/max/mc/current" ENTER
tmux send-keys -t MainMc:1.1 "/home/max/mc/current/bedrock_server"  ENTER
# tmux a
