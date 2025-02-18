{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		starship
		# nerdfonts
	];
  programs.starship = {
    enable = true;
		enableFishIntegration = true;
		settings = pkgs.lib.importTOML ./starship.toml;
  };
}
