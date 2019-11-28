{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./server.nix  -A config.system.build.server
{
  system.build.server = import <nixpkgs/nixos/lib/make-disk-image.nix> {
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
  services.openssh.enable = true;

  users.mutableUsers = false;

  users.users.root = {
    initialPassword = "root";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
    ];
  };

}
