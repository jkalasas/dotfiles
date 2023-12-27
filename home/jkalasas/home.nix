{ configs, hyprland, pkgs, ... }: {
  imports = [
    hyprland.homeManagerModules.default
    ./programs
  ];

  home = {
    username = "jkalasas";
    homeDirectory = "/home/jkalasas";
  };

  home.packages = with pkgs; [
    pfetch
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
