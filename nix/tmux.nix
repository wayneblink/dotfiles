{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.tokyo-night-tmux
    ];

    extraConfig = ''
      unbind C-b
      set -g prefix C-Space
      bind Space send-prefix

      # Easy config reload
      bind-key R source-file ~/.tmux.conf \; display-message "tmux.conf reloaded."

      # vi is good
      setw -g mode-keys vi

      # mouse behavior
      setw -g mouse on

      set -g default-terminal "tmux-256color"
      set -sg terminal-overrides ",*:RGB"

      bind-key : command-prompt
      bind-key r refresh-client
      bind-key L clear-history

      bind-key space next-window
      bind-key bspace previous-window
      bind-key enter next-layout

      # use vim-like keys for splits and windows
      bind-key v split-window -h
      bind-key s split-window -v
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key C-o rotate-window

      bind-key + select-layout main-horizontal
      bind-key = select-layout main-vertical

      set-window-option -g other-pane-height 25
      set-window-option -g other-pane-width 80
      set-window-option -g display-panes-time 1500
      set-window-option -g window-status-current-style fg=magenta

      bind-key a last-pane
      bind-key q display-panes
      bind-key c new-window
      bind-key t next-window
      bind-key T previous-window

      bind-key [ copy-mode
      bind-key ] paste-buffer

      # Setup 'v' to begin selection as in Vim
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

      # Update default binding of 'Enter' to also use copy-pipe
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

      # Set window notifications
      setw -g monitor-activity on
      set -g visual-activity on

      set -g lock-command vlock
      set -g lock-after-time 0

      # Allow the arrow key to be used immediately after changing windows
      set-option -g repeat-time 0
    '';
  };
}
