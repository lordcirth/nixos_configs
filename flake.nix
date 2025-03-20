{
  description = "VM Image";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators, }: {

    kvm = nixos-generators.nixosGenerate {
      system = "x86_64-linux";
      format = "raw";
      modules = [
        {
          nix.registry.nixpkgs.flake = nixpkgs;
          virtualisation.diskSize = 20 * 1024;
        }
        ./defaults.nix
        #./server.nix
      ];

    };
  };
}
