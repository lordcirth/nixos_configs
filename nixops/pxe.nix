{ config, pkgs, ... }:
# Configure this host as a PXE boot server
{
  services.dnsmasq = {
    enable = true;
    extraConfig = ''
      enable-tftp
      tftp-root=/srv/tftp/
    '';
  };
    #${syslinux}
}
