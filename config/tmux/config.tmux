# ---------------------------------------------------------------------

# hot config reload (sorta)
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# sensible prefix key
unbind C-a
set -g prefix C-a
bind C-a send-prefix

# mouse support
set -g mouse on

# start indexing at 1
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on

# scroll history
set-option -g history-limit 10000

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

# status bar style
set -g status-bg white
set -g status-fg black
set -g pane-active-border-style fg=white
set -g pane-border-style fg=brightblack

# status bar contents
set -g status-interval 5
set -g status-left ' '
set -g status-right '"#(hostname)" | %Y-%m-%d T %H:%M:%S '
# set -g status-right-length 120

# only show status bar if >1 window
# https://www.reddit.com/r/tmux/comments/90cm3w/help_how_to_show_status_if_number_of_windows_is/
set -g status off
set-hook -g window-linked "if -F '#{==:#{session_windows},1}' 'set -g status off' 'set -g status on'"
set-hook -g window-unlinked "if -F '#{==:#{session_windows},1}' 'set -g status off' 'set -g status on'"

# ---------------------------------------------------------------------

# default `$TERM`
set -g default-terminal xterm

# fixes tab-completion
# https://web.archive.org/web/20140109014333/http://blog.e-thang.net/2012/08/14/tmux-and-bash-tab-completion/
# https://www.reddit.com/r/tmux/comments/ma26ej/tab_button_not_working_in_tmux/gs39i4z/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
unbind -n Tab

# fixes window resizing
set-window-option -g aggressive-resize

# https://superuser.com/a/1330842
#set -g default-command "${SHELL}"

# https://yazi-rs.github.io/docs/image-preview#tmux
set -g allow-passthrough on
set -ga update-environment TERM
set -ga update-environment TERM_PROGRAM
