{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      waybar
    ];

    file.".config/waybar/style.css".source = ./style.css;
    file.".config/waybar/config.jsonc".source = ./config.jsonc;
    file.".config/waybar/modules.json".source = ./modules.json;
  };
}
