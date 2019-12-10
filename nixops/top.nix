{
  defaults = {
    imports = [ ./ssh.nix ];
  };

  haproxy = import ./haproxy.nix;
}
