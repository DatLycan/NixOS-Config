{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      dunst
    ];

    file.".config/dunst/dunstrc".source = ./dunstrc.ini;
  };
}
