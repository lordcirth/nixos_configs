{
  network = { rollback = true; };

  defaults = { imports = [ ./vbox.nix ]; };

  haproxy = import ./haproxy.nix {
    #    inherit config pkgs;
    backends = [ ];
  };

  web01 = import ./web.nix;
  web02 = import ./web.nix;

  #pxe = import ./pxe.nix;
  #pxe = import ./netboot_server.nix;

  # ram = import ./ramdisk.nix;
}
