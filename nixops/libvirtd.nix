{
  nixos-lxqt =
  {
    deployment.targetEnv = "libvirtd";
    deployment.libvirtd.vcpu = 2;
    deployment.libvirtd.memorySize = 1024;
  };
}
