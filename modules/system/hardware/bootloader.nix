{common, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 3;

      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";

      timeout = 0;
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
      logo = common.resources.bootLogo;
    };
  };
}
