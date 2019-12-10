{ pkgs, lib, config, ... }:
# nix-build '<nixpkgs/nixos>' --arg configuration ./core.nix  -A config.system.build.image
let d = import ./defaults.nix { inherit pkgs; }; in
{
  system.build.image = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit pkgs lib config;
    diskSize = 4 * 1024;
    format = "raw";
  };

  fileSystems = d.fileSystems // {};
  boot = d.boot // {};

  users = d.users // {
    users.root.initialPassword = "root";
  };

  environment.systemPackages = [ vim ];
}
