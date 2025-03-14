let mons = ["nixos-ceph-0" "nixos-ceph-1" "nixos-ceph-2"]; in
rec {
  network.rollback = true;
  network.storage.legacy = { databasefile = "~/.nixops/deployments.nixops"; };


  defaults = {
    imports = [ ./all.nix ./bob.nix ./kvm.nix ./routes.nix ];
    networking.firewall.enable = false;
  };

  nixos-ceph-0 = {
    deployment.targetHost = "172.19.55.2";
    imports = [ (import ./ceph.nix {name = "nixos-ceph-0"; inherit mons; })];
  };

  nixos-ceph-1 = {
    deployment.targetHost = "172.19.55.3";
    imports = [ (import ./ceph.nix {name = "nixos-ceph-1"; inherit mons; })];
  };

  nixos-ceph-2 = {
    deployment.targetHost = "172.19.55.131";
    imports = [ (import ./ceph.nix {name = "nixos-ceph-2"; inherit mons; })];
  };
}
