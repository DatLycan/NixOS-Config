{
  description = "DatLycan's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
  };

  outputs = { 
    self, 
    nixpkgs,
    nvf,
    stylix,
    disko,
    ... 
    } 
    @inputs:
    let 
      system = "x86_64-linux";
      version = "24.11";
      common = import ./common/common.nix;
    in 
    {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit version;
          inherit common; 
        };
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };

      installer = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit version;
          inherit common; 
        };
        modules = [
          ./tools/installer/configuration.nix
          disko.nixosModules.disko
        ];
      };
    };
  };
}
