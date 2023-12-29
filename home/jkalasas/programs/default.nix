{ ... }:
{
  imports = [
    ./alacritty
    ./dunst
    ./hypr
    ./nvim
    ./rofi
    ./swaylock
    ./thunar
    ./tmux
    ./waybar
    ./zathura
    ./zsh
  ];

  home.xdg.mimeApps = rec {
    enable = true;
    associations.added = {
      "video/mp4" = ["mpv.desktop"];
      "video/x-matroska" = ["mpv.desktop"];
    };
  };
}
