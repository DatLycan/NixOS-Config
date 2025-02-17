{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		starship
	];
  programs.starship = {
    enable = true;
		enableFishIntegration = true;
		interactiveShellInit = builtins.readFile ./starship.fish;
  };
}
