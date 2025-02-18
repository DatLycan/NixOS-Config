{
  imports = [
    ./main.nix
    ./binds.nix
  ];

  home.packages = with pkgs; [
    hyprland
    waybar
    rofi-wayland
  ];
}
