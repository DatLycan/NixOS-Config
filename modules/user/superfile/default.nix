{ config, pkgs, ...}:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  configPath = config.home.homeDirectory + "/.config";
in
{
  home = {
    packages = with pkgs; [
      superfile
    ];

    # file = {
    #   "./config.toml".source = symlink "${configPath}/superfile";
    #   "./hotkeys.toml".source = symlink "${configPath}/superfile";
    # }; 
  };
}
