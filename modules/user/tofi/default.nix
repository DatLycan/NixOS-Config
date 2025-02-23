{ pkgs, ... }:

{
  home = {

    packages = with pkgs; [
      tofi
    ];

    file.".config/tofi/config".source = ./config.ini;
  };
}
