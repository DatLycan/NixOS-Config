{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.usbip-module;
in {
  options.usbip-module = {
    enable =
      lib.mkEnableOption "Enable USB IP support"
      // {
        default = false;
      };

    server = {
      enable = lib.mkOption {default = false;};
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      linuxKernel.packages.linux_6_11.usbip
    ];

    boot.kernelModules = [
      "usbip_core"
      "usbip_host"
      "vhci_hcd"
    ];

    systemd.services.usbip-server = lib.mkIf cfg.server.enable {
      description = "USB IP Server";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "forking";
        ExecStart = "/run/current-system/sw/bin/usbipd";

        WorkingDirectory = "/run/current-system/sw/bin/";
        User = "root";
      };
    };

    networking.firewall.extraCommands = ''
      iptables -A nixos-fw -p tcp --source 192.168.0.0/16 --dport 3240 -j nixos-fw-accept
    '';
  };
}
