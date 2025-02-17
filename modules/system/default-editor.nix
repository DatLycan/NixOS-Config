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
            name = "gruvbox";
            style = "dark";
          };
          
          languages = {
            enableLSP = true;
            enableTreesitter = true;

            nix.enable = true;
          };

        };
      };
    };
  };
}
