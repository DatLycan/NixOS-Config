{ pkgs, ... }:

{
	home.packages = with pkgs; [
		zsh
		thefuck
		fzf
		bat
		eza
		zoxide
	];

  programs.zsh = {
		enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
		# interactiveShellInit = builtins.readFile ./config.fish;
	};

  users.defaultUserShell = pkgs.zsh;
}
