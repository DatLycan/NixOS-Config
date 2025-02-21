{ pkgs, ... }:

{
	home = {
		packages = with pkgs; [
			foot
			thefuck
			fzf
			bat
			eza
			zoxide
		];

		file.".config/foot/foot.ini".source = ./foot.ini;
	};
}
