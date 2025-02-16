{ inputs, version, id, ... }:
{
  home-manager = {
    extraSpecialArgs = { 
      inherit inputs; 
      inherit id;
      inherit version;
    };
    users = {
      "${id.userName}" = import ./home.nix;
    };
  };
}
