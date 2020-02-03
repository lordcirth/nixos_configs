{
  network = { enableRollback = true; };

  nixos-lxqt = { config, pkgs, lib, ... }: {

    environment.systemPackages = [ pkgs.neovim ];

    #networking.proxy.default = "http://192.168.1.146:3128";
    services.openssh = {
      enable = true;
      permitRootLogin = "yes";
    };

    users.extraUsers.root = {
      hashedPassword =
        "$6$OsQZFtbN$7xzZ.G5Sm93dioYHsWvUd3Zhyx7.b3FM0gYYnh1kwIhA1bjuo/jy2PCLLtagEL2iieb4.lzYcvGy9Mzj5BuGV0";
    };

  };
}
