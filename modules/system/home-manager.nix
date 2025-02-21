{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."${config.default-user.userName}" = import ./home.nix;
    backupFileExtension = "backup";
  };
}
