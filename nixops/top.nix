{
  network = { rollback = true; };
  defaults = { imports = [ ./all.nix ./bob.nix ./kvm.nix ]; };

  kvm = {
    deployment.targetHost = "192.168.1.222";
    services.ipfs = {
      enable          = true;
      apiAddress      = "/ip4/192.168.1.222/tcp/5001";
      gatewayAddress  = "/ip4/192.168.1.222/tcp/8080";
    };

  };

#  pxe = {
#    deployment.targetHost = "192.168.1.248";
#    imports = [ ./pxe.nix ];
#  };
}
