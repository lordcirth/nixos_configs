{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./laptop.nix  -A config.system.build.laptop
{
  system.build.laptop = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit pkgs lib config;
    diskSize = 2 * 1024;
    format = "raw";
  };
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  }; 

  boot.loader.grub.devices = [ "/dev/vda" ];
  boot.plymouth.enable = true;
  users.users.root.initialPassword = "root";

#    services.xserver = {
#      displayManager.slim.enable = true;
#      desktopManager.xfce.enable = true;
#      enable = true;
#    };
}
