{
  description = "DatLycan's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    # Extras
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
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
          ./hardware-configuration.nix
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
          inputs.nvf.nixosModules.default
          inputs.disko.nixosModules.disko
        ];
      };
    };
  };
}
