{ pkgs, ... }:

{
	home.packages = with pkgs; [
		fish
		thefuck
		fzf
		bat
		eza
		zoxide
	];

  programs.fish = {
		enable = true;
		interactiveShellInit = builtins.readFile ./config.fish;
	};
}
