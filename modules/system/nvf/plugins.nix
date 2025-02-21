{
  programs.nvf.settings.vim = {

    binds.whichKey.enable = true;

    telescope.enable = true;
    ui.noice.enable = true;

    utility.motion.hop = {
      enable = true;
      mappings.hop = "F";
    };

    mini.comment.enable = true;
    mini.files.enable = true;

    autocomplete.blink-cmp = {
      enable = true;
      mappings = {
        next = "<Down>";
        previous = "<Up>";
      };
    };
  };
}
