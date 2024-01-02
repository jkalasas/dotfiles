{ ... }:
{
  imports = [
    ./alacritty
    ./cava
    ./dunst
    ./hypr
    ./nvim
    ./mpd
    ./moosync
    ./obsidian
    ./rofi
    ./swaylock
    ./thunar
    ./tmux
    ./waybar
    ./zathura
    ./zsh
  ];

  xdg.mimeApps = rec {
    enable = true;
    associations.added = {
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
    };
    defaultApplications = associations.added;
  };
}
