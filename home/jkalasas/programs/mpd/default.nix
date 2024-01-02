{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ymuse
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/run/media/Linuxuu/Music";
    network.listenAddress = "any";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Pipewire server"
      }
    '';
  };
}
