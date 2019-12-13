{
  defaults = {
    imports = [ ./vbox.nix ];
  };

  haproxy = import ./haproxy.nix;

  web01 = import ./web.nix;
}
