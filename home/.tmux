# allow mouse interaction
# set-option -g mouse on

# Change prefix key to CTRL+A. "C-" stands for CTRL, "M-" stands for ALT key
set-option -g prefix C-z
# unbind-key C-b
bind-key C-z send-prefix

# :set status on
# from https://github.com/Starefossen/dotfiles/blob/master/.tmux.conf
set -g status             on    # always show the status bar
# source-file ~/.tmux.conf
set -g default-terminal "screen-256color"
