{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      rofi
    ];
  
    file.".config/rofi/theme.rasi".source = ./theme.rasi;
    file.".config/rofi/config.rasi".source = ./config.rasi;
  };
}

