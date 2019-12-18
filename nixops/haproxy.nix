{ config, pkgs, backends, ... }:
let

  global = builtins.readFile ./haproxy.conf;

  backend = ''
    backend servers
      option httpchk GET /
      server server01 192.168.56.105:80 check 
      server server02 192.168.56.107:80 check 
  '';
in {
  #services.keepalived.enable = true;

  services.haproxy = {
    config = global + backend;
    enable = true;
  };
}
