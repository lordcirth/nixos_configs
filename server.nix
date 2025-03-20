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
  system.stateVersion = "23.11";
  environment.systemPackages = with pkgs; [ tmux tcpdump ethtool iotop htop ];
}
