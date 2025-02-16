{
  description = "Personal desktop config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    ... 
    } 
    @inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          version = "24.11";
          id = import ./common/resources/identity.nix;
        };
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      installer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            version = "24.11";
          };
          modules = [
            inputs.disko.nixosModules.disko
            ./hosts/installer/configuration.nix
          ];
      };
    };
  };
}
