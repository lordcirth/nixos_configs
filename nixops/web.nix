{ config, pkgs, ... }: {
  services.httpd = {
    enable = true;
    adminAddr = "lordcirth@gmail.com";
    documentRoot = "/var/www";
  };

  systemd.services.httpd-init = {
    script = ''
      mkdir -p /var/www &&\
      echo 'hi' > /var/www/index.html
      chown -R wwwrun /var/www
    '';
    restartIfChanged = true;
    before = [ "httpd.service" ];
    requiredBy = [ "httpd.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
