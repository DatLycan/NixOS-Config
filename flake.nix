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

    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";

  };

  outputs = { 
    self, 
    nixpkgs,
    nvf,
    stylix,
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
          common = import ./common/common.nix;
        };
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default

          nvf.nixosModules.default
          stylix.nixosModules.stylix
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
