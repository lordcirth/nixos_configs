{ config, pkgs, ... }: {
  boot.loader.grub.devices = [ "/dev/sda" ];
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
    };

    services.qemuGuest.enable = true;
    networking.firewall.enable = false;
}
