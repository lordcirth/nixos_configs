{
  network = {
    enableRollback = true;
  };

  demo =
    { config, pkgs, ... }:
    {
      deployment.targetHost = "192.168.122.136"; 
      boot.loader.grub.devices = [ "/dev/vda" ];
      fileSystems."/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      };
    boot.plymouth.enable = false;
    services.openssh.enable = true;

    users.mutableUsers = false;

    users.users.root = {
      initialPassword = "root";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
      ];
    };
  };
}
