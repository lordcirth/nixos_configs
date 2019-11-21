{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./laptop.nix  -A config.system.build.laptop
{
  system.build.laptop = import <nixpkgs/nixos/lib/make-disk-image.nix> {
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

  services.xserver = {
    #displayManager.slim.enable = true;
    desktopManager.lxqt.enable = true;
    #windowManager.openbox.enable = true;
    enable = true;
  };
}
