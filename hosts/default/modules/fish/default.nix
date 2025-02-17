{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		fish
		thefuck
		fishPlugins.fzf
	];
  programs.fish = {
		enable = true;
		interactiveShellInit = builtins.readFile ./config.fish;
	};
}
