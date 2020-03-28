{ config, pkgs, ... }: {

  # https://github.com/NixOS/nixops/issues/574#issuecomment-443540177
  systemd.additionalUpstreamSystemUnits =
    [ "proc-sys-fs-binfmt_misc.automount" "proc-sys-fs-binfmt_misc.mount" ];

  environment.systemPackages = [ pkgs.vim ];

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

}
