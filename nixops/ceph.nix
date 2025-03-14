{ name, mons }:
{ config, pkgs, lib, ... }: {
  services.ceph = {
    enable = true;
    global.fsid = "7a211816-11a2-11ea-9857-530b70515763";

    mon.enable = true;
    mon.daemons = [name];
    global.monInitialMembers = (builtins.concatStringsSep "," mons);
    global.monHost = name;
  };
  environment.systemPackages = [ pkgs.ceph ];
  networking.extraHosts = ''
    172.19.55.2 nixos-ceph-0
    172.19.55.3 nixos-ceph-1 
    172.19.55.131 nixos-ceph-2
  '';
}
