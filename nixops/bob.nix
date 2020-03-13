{
  users.users.bob = {
    uid = 1020;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword =
      "$6$OsQZFtbN$7xzZ.G5Sm93dioYHsWvUd3Zhyx7.b3FM0gYYnh1kwIhA1bjuo/jy2PCLLtagEL2iieb4.lzYcvGy9Mzj5BuGV0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILuHIVfeoZ+0OGL2hfOSZu9MV247e+u1i/jb323iCkUr nfish@rsg-pc247"
    ];
  };
}
