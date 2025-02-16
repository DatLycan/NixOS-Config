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
    @inputs:
    let 
      system = "x86_64-linux";
      version = "24.11";
    in 
    {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit version;
          id = import ./common/resources/identity.nix;
        };
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      installer = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit system;
            inherit version;
          };
          modules = [
            ./hosts/installer/configuration.nix
            inputs.disko.nixosModules.disko
          ];
      };
    };
  };
}
