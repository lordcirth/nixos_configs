{
  network.rollback = true;
  network.storage.legacy = { databasefile = "~/.nixops/deployments.nixops"; };

  defaults = {
    imports = [ ./all.nix ./bob.nix ./kvm.nix ./routes.nix ];
    networking.firewall.enable = false;
  };

  nixos-ceph-0 = { deployment.targetHost = "172.19.55.2"; };
}
