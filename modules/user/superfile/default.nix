{ pkgs, ... }:

{
	home = {
		packages = with pkgs; [ 
			superfile
		];

		file.".config/superfile/config.toml".source = ./config.toml;
		file.".config/superfile/hotkeys.toml".source = ./hotkeys.toml;
	};
}
