{
  network = { rollback = true; };
  defaults = { imports = [ ./ssh.nix ]; };

  kvm = {
    deployment.targetHost = "192.168.1.222";
    services.qemuGuest.enable = true;
  };
}
