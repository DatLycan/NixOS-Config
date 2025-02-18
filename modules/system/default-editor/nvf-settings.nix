{
  programs.nvf.settings.vim = {
        
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
