{ configs, pkgs }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      sensible
      vim-tmux-navigator
      yank
    ];

    extraConfig = ''
    set-option -sa terminal-overrides ",xterm*:Tc"
    set -g mouse on

    # Prefix
    #unbind C-b
    #set -g prefix C-Space
    #bind C-Space send-prefix

    bind -n M-H previous-window
    bind -n M-L next-window

    # Windows start at 1
    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1

    # vi mode
    set-window-option -g mode-keys vi

    # keybindings
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
  
    bind '"' split-window -v -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"

    # zsh default shell
    set-option -g default-shell /bin/zsh
    '';
  };
}
