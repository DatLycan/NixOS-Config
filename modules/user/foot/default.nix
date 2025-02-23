{ pkgs, ... }:

{
  home = {

  packages = with pkgs; [
    foot
  ];

  file.".config/foot/foot.ini".source = ./foot.ini;
  };
}
