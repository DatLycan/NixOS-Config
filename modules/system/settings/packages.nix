{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.packages-module;
in {
  options.packages-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = true;
      };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      wget
      curl
      git
      unzip
      wl-clipboard
      lazygit
      git-credential-oauth
    ];
  };
}
