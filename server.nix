{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./server.nix  -A config.system.build.image
{
  #imports = [ ./defaults.nix { inherit pkgs; } ];
  imports = [ ./defaults.nix ];

  system.build.image = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit pkgs lib config;
    diskSize = 4 * 1024;
    format = "raw";
  };

  users.users.root = {
    password = "root";
    # If this is not also in the NixOps config, you will be locked out!
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILuHIVfeoZ+0OGL2hfOSZu9MV247e+u1i/jb323iCkUr nfish@rsg-pc247"
    ];
  };
}
