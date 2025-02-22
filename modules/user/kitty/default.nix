{ pkgs, ... }:

{
	home = {
		packages = with pkgs; [ 
			kitty
		];

		file.".config/kitty/kitty.conf".source = ./kitty.conf;
	};
}
