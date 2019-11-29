{
  demo = 
    { config, pkgs, ... }:
    {
    services.ceph = {
      enable = true;
      global.fsid = "7a211816-11a2-11ea-9857-530b70515763";

      mon.enable = true;
      mon.daemons = [ "demo" ];
      global.monInitialMembers = "demo";
      global.monHost = "demo";
    };
    environment.systemPackages = [ pkgs.ceph ];
  };
}
