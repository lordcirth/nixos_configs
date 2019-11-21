{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./core.nix  -A config.system.build.core
{
  system.build.core = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit pkgs lib config;
    diskSize = 4 * 1024;
    format = "raw";
  };
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  }; 

  boot.loader.grub.devices = [ "/dev/vda" ];
  boot.plymouth.enable = false;
  users.users.root.initialPassword = "root"; #TODO
}
