{ config, pkgs, ... }:

{
  imports =
    [      
      ./hardware-configuration.nix
      ../hosts/desktop
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "devtop";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_PH.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
  };

  programs.zsh.enable = true;
  users.users.jkalasas = {
    isNormalUser = true;
    description = "Kyle";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # browsers
    firefox

    #editors
    neovim

    # misc
    curl
    git
    gnome.adwaita-icon-theme
    light
    pamixer
    pavucontrol
    playerctl
    wget
    xdg-user-dirs
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver
  ];

  networking.nameservers = [
    "1.1.1.1" "1.0.0.1"
  ];

  fileSystems."/run/media/Linuxuu" = {
    device = "/dev/disk/by-uuid/c24c4bff-581c-469c-8f35-ffac27145555";
    fsType = "ext4";
  };
}
