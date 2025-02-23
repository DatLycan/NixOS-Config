{ pkgs, ... }:

{
	home = {
		packages = with pkgs; [
	    chromium	
		];
	};

  programs.chromium = {
		enable = true;
    package = pkgs.brave;
    
    extensions = [
      { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; } #Vimium
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } #Return YT dislikes
    ];
    
    commandLineArgs = [
      "--enable-features=WebContentsForceDark"
    ];
	};
}
