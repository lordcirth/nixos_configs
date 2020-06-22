{ config, pkgs, name, ... }: {
    services.ceph = {
      enable = true;
      global.fsid = "7a211816-11a2-11ea-9857-530b70515763";

      mon.enable = true;
      mon.daemons = [ name ];
      global.monInitialMembers = name;
      global.monHost = name;
    };
    environment.systemPackages = [ pkgs.ceph ];
}
