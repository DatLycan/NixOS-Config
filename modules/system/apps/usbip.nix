{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.usbip-module;
in {
  options.usbip-module = {
    enable = lib.mkEnableOption "Enable USB IP support";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      linuxKernel.packages.linux_6_14.usbip
    ];
  };
}
