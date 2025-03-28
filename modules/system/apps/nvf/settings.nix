{common, ...}: {
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      name = "${common.default.theme}";
      style = "dark";
    };

    enableLuaLoader = true;
    useSystemClipboard = true;
    spellcheck.enable = false;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix = {
        enable = true;
        format.enable = true;
      };

      csharp.enable = true;
    };

    options = {
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
    };
  };
}
