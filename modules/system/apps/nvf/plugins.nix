{
  programs.nvf.settings.vim = {
    binds.whichKey.enable = true;

    telescope.enable = true;
    ui.noice.enable = true;
    formatter.conform-nvim.enable = true;
    runner.run-nvim.enable = true;

    utility.motion.hop = {
      enable = true;
      mappings.hop = "F";
    };

    mini = {
      comment.enable = true;
      tabline.enable = true;
      statusline.enable = true;
      move.enable = true;
    };

    autocomplete.blink-cmp = {
      enable = true;
      setupOpts.keymap.preset = "default";
    };
  };
}
