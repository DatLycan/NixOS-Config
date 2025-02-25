{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      waybar
    ];

    # file.".config/tofi/config".source = ./config.ini;
  };
}
