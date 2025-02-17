{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		fish
	];

	xdg.configFile."config.fish".source = ./config.fish;

  programs.fish = {
    enable = true;
  };
}
