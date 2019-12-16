{ config, pkgs, ... }:
{
  deployment.targetEnv = "virtualbox";
  deployment.virtualbox = {
    memorySize = 1024;
    vcpu = 2;
    headless = true;
  };

  # https://github.com/NixOS/nixops/issues/574#issuecomment-443540177
  systemd.additionalUpstreamSystemUnits =
  [ "proc-sys-fs-binfmt_misc.automount"
    "proc-sys-fs-binfmt_misc.mount"
  ];
}
