{ configs, hyprland, pkgs, ... }: {
  imports = [
    hyprland.homeManagerModules.default
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "jkalasas";
    homeDirectory = "/home/jkalasas";
  };

  home.packages = (with pkgs; [
    # user
    telegram-desktop

    pfetch

    # misc
    bibata-cursors
    btop
    eza
    grim
    networkmanagerapplet
    rofi
    slurp
    tty-clock
    tokyo-night-gtk
    wl-clipboard
    wofi
    xfce.thunar
  ]) ++ (with pkgs.gnome; [
    zenity
    gnome-tweaks
    eog
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Macchiato-Compact-Lavender-Dark";
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
