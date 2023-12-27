{ configs, pkgs, ... }: {
  programs.home-manager.enable = true;

  home = {
    username = "jkalasas";
    homeDirectory = "/home/jkalasas";
  };

  home.packages = with pkgs; [
    pfetch
  ];

  home.stateVersion = "23.11";
}
