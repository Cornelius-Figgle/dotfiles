
# ---------------------------------------------------------------------

# reloads config
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# default `$TERM`
set -g default-terminal xterm

# prefix key
unbind C-a
set -g prefix C-a
bind C-a send-prefix

# mouse?
set -g mouse on

# scroll history
set-option -g history-limit 5000

# index 1
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on

# better splits
unbind %
unbind '"'
bind-key "+" split-window -h -c "#{pane_current_path}"
bind-key "=" split-window -fh -c "#{pane_current_path}"
bind-key "-" split-window -v -c "#{pane_current_path}"
bind-key "_" split-window -fv -c "#{pane_current_path}"

# moving between panes
bind -n C-Left select-pane -L
bind -n C-Right select-pane -R
bind -n C-Up select-pane -U
bind -n C-Down select-pane -D

# new window in curdir
unbind q
bind q new-window -c "#{pane_current_path}"

# close window
unbind &
bind c kill-window

# close pane
unbind x
bind x kill-pane

# resizing
bind -n C-o resize-pane -D 5
bind -n C-i resize-pane -U 5
bind -n C-u resize-pane -L 5
bind -n C-p resize-pane -R 5


# ---------------------------------------------------------------------

set -g status-interval 2
set -g status-left '#{prefix_highlight}[#{online_status}] '
set -g status-right 'CPU: #(python3 -c "import psutil;print(psutil.cpu_percent(interval=2))")%% RAM: #(python3 -c "import psutil;print(psutil.virtual_memory().percent)")%% | %Y-%m-%d T %H:%M:%S'
# set -g status-right '#(~/.tmux/plugins/tmux-mem-cpu-load/tmux-mem-cpu-load --interval 2) | %Y-%m-%d T %H:%M:%S'
set -g status-right-length 120

# ---------------------------------------------------------------------

set -g status-bg white
set -g status-fg black
set -g pane-active-border-style fg=white
set -g pane-border-style fg=brightblack

set -g @online_icon "online"
set -g @offline_icon "offline"

# ---------------------------------------------------------------------

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'noscript/tmux-mighty-scroll'
set -g @plugin 'ofirgall/tmux-window-name'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-online-status'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'