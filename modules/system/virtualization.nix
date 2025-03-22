{
  lib,
  config,
  ...
}: let
  cfg = config.virtualization;
in {
  options.virtualization = {
    enable =
      lib.mkEnableOption "Enable virtualization module"
      // {
        default = false;
      };
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = [config.default-user.userName];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}
