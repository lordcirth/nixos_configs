{ config, pkgs, ... }:
{
  deployment.targetEnv = "virtualbox";
  deployment.virtualbox = {
    memorySize = 1024;
    vcpu = 2;
    headless = true;
  };
}
