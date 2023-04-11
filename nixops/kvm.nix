{ config, pkgs, ... }: {
  boot.loader.grub.devices = [ "/dev/vda" ];
  fileSystems."/" = {
    device = "/dev/vda1";
    fsType = "ext4";
    };
    boot.initrd.availableKernelModules = [ "virtio_balloon" "virtio_blk" "virtio_pci" "virtio_ring" ];
    deployment.hasFastConnection = true;
    services.qemuGuest.enable = true;
    networking.firewall.enable = false;
}
