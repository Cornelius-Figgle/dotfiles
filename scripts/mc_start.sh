#!/bin/bash

tmux new -s MainMc -d
tmux send-keys -t MainMc:0.0 "cd /home/max/mc/current" ENTER
tmux send-keys -t MainMc:0.0 "/home/max/mc/current/bedrock_server"  ENTER
# tmux a
