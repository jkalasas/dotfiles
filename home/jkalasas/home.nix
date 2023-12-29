{ configs, hyprland, pkgs, ... }:
{
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
    # dev stuff
    corepack_21
    lazygit
    nodejs_21
    python3
    python311Packages.pip
    openssl

    # user
    discord
    mpv
    telegram-desktop
    yt-dlp

    # misc
    archiver
    bibata-cursors
    brightnessctl
    btop
    eza
    font-manager
    grim
    grimblast
    networkmanagerapplet
    pfetch
    slurp
    tty-clock
    unrar
    unzip
    tokyo-night-gtk
    wl-clipboard
    xfce.thunar
  ]) ++ (with pkgs.gnome; [
    file-roller
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
