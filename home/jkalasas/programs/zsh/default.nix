{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "${config.xdg.dataHome}/zsh/history";

    onMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" "zsh-autosuggestion" ];
      theme = "robbyrussell";
    };
  };
}
