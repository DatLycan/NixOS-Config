{pkgs, ...}: {
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
      # logo = pkgs.fetchurl {
      #   url = "https://avatars.githubusercontent.com/u/37188830?v=4&s=200";
      #   sha256 = "8d1aa69b376113886062dbf5399f5e0b0aa028f1b602163d72e3d4df4f113d29";
      # };
    };
  };
}
