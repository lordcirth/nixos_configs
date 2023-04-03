nix-build '<nixpkgs/nixos>' --arg configuration ./server.nix  -A config.system.build.image
