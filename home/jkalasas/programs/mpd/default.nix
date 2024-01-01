{ config, pkgs, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/run/media/Linuxuu/Music";
    network.listenAddress = "any";
    startWhenNeeded = true;
    extraConfig = ''
      audio_output {
          type "pipewire"
          name "Pipewire server"
      }
    '';
  };
}
