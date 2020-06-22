{
  network = { rollback = true; };
  defaults = { imports = [ ./all.nix ./bob.nix ./kvm.nix ]; };

  dev = {
    deployment.targetHost = "192.168.1.222";
    networking.firewall.enable = false;
    imports = [ ./ipfs.nix ];
  };
}
