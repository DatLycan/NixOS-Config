{ lib, config, ... }:

let 
  cfg = config.default-editor;
in
{
  options.default-editor = {
    enable = lib.mkEnableOption "Enable default-editor module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf = {
      enable = true;

      settings = {
        vim = {
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

          statusline.lualine.enable = true;
          ui.noice.enable = true;
        };
      };
    };
  };
}
