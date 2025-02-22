{
  programs.nvf.settings.vim = {

    binds.whichKey.enable = true;

    telescope.enable = true;
    ui.noice.enable = true;

    utility.motion.hop = {
      enable = true;
      mappings.hop = "F";
    };

    mini = { 
      comment.enable = true;
      tabline.enable = true;
    };
    
    autocomplete.blink-cmp = {
      enable = true;
      setupOpts.keymap.preset = "enter";
    };
  };
}
