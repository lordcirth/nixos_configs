{ config, pkgs, ... }:
{
  services.httpd = {
    enable = true;
    adminAddr = "lordcirth@gmail.com";
  };
}
