{ config, pkgs, ... }: {
  boot.loader.grub.devices = [ "/dev/sda" ];

  fileSystems."/" = { fsType = "tmpfs"; };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/nix";
    fsType = "ext4";
  };

  boot.plymouth.enable = false;
  services.openssh.enable = true;

  users.mutableUsers = false;

  users.users.root = {
    initialPassword = "root";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILuHIVfeoZ+0OGL2hfOSZu9MV247e+u1i/jb323iCkUr nfish@rsg-pc247"
    ];
  };

  environment.systemPackages = [ pkgs.vim ];
}
