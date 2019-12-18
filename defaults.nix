{ pkgs }:
let rootfs = "/dev/disk/by-label/nixos";
in {
  inherit pkgs;
  fileSystems."/" = {
    device = rootfs;
    fsType = "ext4";
  };

  boot.loader.grub.devices = [ "/dev/vda" ];

  # Expand rootfs to max
  # Stolen from https://github.com/NixOS/nixpkgs/blob/4de58b617bf52509cdfa7946f46505166f0bc3de/nixos/modules/installer/cd-dvd/sd-image.nix#L203
  boot.postBootCommands = ''
    bootDevice=$(lsblk -npo PKNAME ${rootfs})
    echo ",+," | sfdisk -N0 --no-reread $bootDevice
    ${pkgs.parted}/bin/partprobe
    ${pkgs.e2fsprogs}/bin/resize2fs "${rootfs}"
  '';

  services.openssh.enable = true;

  users.mutableUsers = false;
}
