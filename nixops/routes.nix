{ config, pkgs, ... }: {
  networking.interfaces.ens3.ipv4.routes = [
    { address = "172.19.0.0"; prefixLength = 16; via = "172.19.55.1"; }
    { address = "129.97.0.0"; prefixLength = 16; via = "172.19.55.1"; }
    { address = "10.0.0.0"; prefixLength = 8; via = "172.19.55.1"; }
  ];

    networking.defaultGateway = { address = "172.19.55.254"; interface = "ens3"; };
}
