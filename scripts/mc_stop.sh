#!/bin/bash

tmux send-keys -t MainMc:0.0 "say server exiting in 10 seconds" ENTER
sleep 10
tmux send-keys -t MainMc:0.0 "stop"  ENTER
tmux kill-server -t MainMc
