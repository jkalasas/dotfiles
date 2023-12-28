{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "jkalasas" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
