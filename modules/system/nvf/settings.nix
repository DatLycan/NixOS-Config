{
  programs.nvf.settings.vim = {
    
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
    };

    enableLuaLoader = true;
    useSystemClipboard = true;
        
    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
    };

    options = {
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
    };
  };
}
