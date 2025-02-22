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

    ];
    
    commandLineArgs = [];
	};
}
