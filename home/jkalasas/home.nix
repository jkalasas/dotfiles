{ configs, hyprland, pkgs, ... }: {
  imports = [
    hyprland.homeManagerModules.default
    ./programs
    ./scripts
  ];

  home = {
    username = "jkalasas";
    homeDirectory = "/home/jkalasas";
  };

  home.packages = with pkgs; [
    pfetch

    # misc
    rofi
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
