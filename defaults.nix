{ pkgs, ... }:
let rootfs = "/dev/disk/by-label/nixos";
in {

  # Expand rootfs to max
  # Stolen from https://github.com/NixOS/nixpkgs/blob/4de58b617bf52509cdfa7946f46505166f0bc3de/nixos/modules/installer/cd-dvd/sd-image.nix#L203
  boot.postBootCommands = ''
    bootDevice=$(lsblk -npo PKNAME ${rootfs})
    echo ",+," | sfdisk -N0 --no-reread $bootDevice
    ${pkgs.parted}/bin/partprobe
    ${pkgs.e2fsprogs}/bin/resize2fs "${rootfs}"
  '';

  system.stateVersion = "24.11";

  services.openssh.enable = true;
  users.users.root = {
    password = "root";
    # If this is not also in the NixOps config, you will be locked out!
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEMiU1uUKbgdcG6h6HR3t0zhB6enaCHrBs5QZlWHJV58 nfish@desna"
    ];
  };

  users.mutableUsers = false;
}
