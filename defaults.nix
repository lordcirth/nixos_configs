{
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  }; 

  boot.loader.grub.devices = [ "/dev/vda" ];
  services.openssh.enable = true;

  users.mutableUsers = false;
}
