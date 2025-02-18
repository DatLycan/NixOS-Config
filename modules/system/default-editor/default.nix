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
    import = [
      ./nvf-settings.nix
      ./nvf-plugins.nix
      ./nvf-mappings.nix
    ];

    programs.nvf.enable = true;
  };
}
