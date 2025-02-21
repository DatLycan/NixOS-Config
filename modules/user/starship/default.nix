{ pkgs, ... }:

{
	home = {
		packages = with pkgs; [ 
			starship 
		];

		file.".config/starship.toml".source = ./starship.toml;
	};

  programs.starship = {
    enable = true;
		enableFishIntegration = true;
  };

}
