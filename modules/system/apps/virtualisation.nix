{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.virtualisation-module;
  d-user = config.user-module.userName;
in {
  options.virtualisation-module = {
    enable = lib.mkEnableOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = [d-user];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    environment.systemPackages = with pkgs; [
      virtiofsd
    ];
  };
}
