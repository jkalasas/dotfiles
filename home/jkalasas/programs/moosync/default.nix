{ config, lib, pkgs, ... }:
let
  appicon = "${config.xdg.configHome}/personal-appicons/moosync-icon.png";
  version = "10.2.0";
  hash = lib.fakeHash;
  moosync-appimage = pkgs.appimageTools.wrapType2 {
    name = "moosync";
    src = pkgs.fetchurl {
      url = "https://github.com/Moosync/Moosync/releases/download/v${version}/Moosync-${version}-linux-x86_64.AppImage";
      hash = hash;
    };
  };
  moosync-desktop-item = pkgs.makeDesktopItem {
    name = "moosync";
    desktopName = "Moosync";
    icon = appicon;
    exec = "moosync";
    terminal = false;
  };
in
{
  home.packages = [
    moosync-appimage
    moosync-desktop-item
  ];

  # desktop entry icon
  home.file."${appicon}".source = ./moosync-icon.png;
}
