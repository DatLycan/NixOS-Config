{
  programs.nvf.settings.vim = {

    enableLuaLoader = true;
    useSystemClipboard = true;
        
    theme = {
      enable = true;
      name = "tokyonight"; #TODO: Sync up with default-style module
      style = "night";
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
    };

  };
}
