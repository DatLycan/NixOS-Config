{
  programs.nvf.settings.vim = {

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
