{ config, pkgs, ... }:
let
  version = "1.5.3";
  hash = "08dhwahgjvz4am34bn2vq6xb3rfj78rilvqyszynsxjjqvfk72q7";
  obsidian-appimage = pkgs.appimageTools.wrapType2 {
    name = "obsidian";
    src = fetchurl {
      url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v${version}/Obsidian-${version}.AppImage";
      hash = hash;
    };
  };
in
{
  home.packages = [
    obsidian-appimage
  ];
}
