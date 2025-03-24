{common, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 3;

      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";

      timeout = 1;
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
      logo = common.resources.bootLogo;
    };
  };
}
