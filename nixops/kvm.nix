{
  network = { rollback = true; };
  defaults = { imports = [ ./ssh.nix ./bob.nix ]; };

  kvm = {
    deployment.targetHost = "192.168.1.222";
    services.qemuGuest.enable = true;
    networking.firewall.enable = false;
    services.ipfs = {
      enable          = true;
      apiAddress      = "/ip4/192.168.1.222/tcp/5001";
      gatewayAddress  = "/ip4/192.168.1.222/tcp/8080";
    };
  };
}
