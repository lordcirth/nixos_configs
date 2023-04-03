{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./server.nix  -A config.system.build.image
{
  imports = [ ./defaults.nix ];

  system.build.image = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit pkgs lib config;
    diskSize = 16 * 1024;
    format = "qcow2";
  };

  services.getty.helpLine = "ens3: \\4{ens3}";
  services.openssh.passwordAuthentication = false;
  users.users.root = {
    password = "root";
    # If this is not also in the NixOps config, you will be locked out!
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEMiU1uUKbgdcG6h6HR3t0zhB6enaCHrBs5QZlWHJV58 nfish@desna"
    ];
  };
  system.stateVersion = "22.11";
}
