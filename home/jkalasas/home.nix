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
    pfetch

    # misc
    bibata-cursors
    btop
    eza
    grim
    rofi
    slurp
    tty-clock
    tokyo-night-gtk
    wl-clipboard
    wofi
  ]) ++ (with pkgs.gnome; [
    nautilus
    zenity
    gnome-tweaks
    eog
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
