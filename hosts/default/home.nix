{ pkgs, ... }:

{
  imports = [
    ./config
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false; # TODO: Remove this line when merging everything to the same version

  home.packages = with pkgs; [
    nil
    
    jetbrains-mono
    
    wl-clipboard
    brave

    hyprland
    wayland
  ];
}
