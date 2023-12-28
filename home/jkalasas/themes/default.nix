{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Yaru-magenta-dark";
      package = pkgs.yaru-theme;
    };

#    theme = {
#      name = "Tokyonight-Dark-B-LB";
#      package = pkgs.tokyo-night-gtk;
#    };
    theme = {
      name = "Catppuccin-Macchiato-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
	size = "compact";
	tweaks = [ "rimless" "black" ];
	variant = "macchiato";
      };
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };
}
