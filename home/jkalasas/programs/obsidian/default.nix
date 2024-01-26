{ config, lib, pkgs, ... }:
let
  appicon = "${config.xdg.configHome}/personal-appicons/obsidian-icon.svg";
  version = "1.5.3";
  hash = "sha256-B4sz3cZSdm391x5vGjM60uWxusFb2EVGVeRv+aDisCE=";
  obsidian-appimage = pkgs.appimageTools.wrapType2 {
    name = "obsidian";
    src = pkgs.fetchurl {
      url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v${version}/Obsidian-${version}.AppImage";
      hash = hash;
    };
  };
  obsidian-desktop-item = pkgs.makeDesktopItem {
    name = "obsidian";
    desktopName = "Obsidian";
    icon = appicon;
    exec = "obsidian %U";
    terminal = false;
    type = "Application";
    comment = "Obsidian";
    startupWMClass = "obsidian";
    mimeTypes = ["x-scheme-handler/obsidian"];
    categories = [ "Office" ];
  };
in
{
  home.packages = [
    obsidian-appimage
    obsidian-desktop-item
  ];

  # desktop entry icon
  home.file."${appicon}".source = ./obsidian-icon.svg;
}
