{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.virtual-here-module;

  vhclient = pkgs.stdenv.mkDerivation rec {
    pname = "vhclient";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64";
      sha256 = "592abf84da931ecda549b97f943b3fe7f1bb3d2f86b9775062f5cbaf88fc5720";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/bin
      cp ${src} $out/bin/vhclient
      chmod +x $out/bin/vhclient
    '';
  };

  vhserver = pkgs.stdenv.mkDerivation rec {
    pname = "vhserver";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64";
      sha256 = "d86a78dc5252861f2b53d4d2dd095c088f6f2eec651066ae63839d7a089b36ec";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/bin
      cp ${src} $out/bin/vhserver
      chmod +x $out/bin/vhserver
    '';
  };
in {
  options.virtual-here-module = {
    enable = lib.mkEnableOption "Enable VirtualHere support";

    client = {
      enable = lib.mkOption {default = false;};
      autostart = lib.mkOption {default = false;};
    };

    server = {
      enable = lib.mkOption {default = false;};
      autostart = lib.mkOption {default = false;};
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib.filter (pkg: pkg != null) [
      (
        if cfg.client.enable
        then vhclient
        else null
      )
      (
        if cfg.server.enable
        then vhserver
        else null
      )
    ];

    # CLIENT
    systemd.services.vhclient = lib.mkIf (cfg.client.enable && cfg.client.autostart) {
      description = "VirtualHere USB Client";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "forking";
        ExecStart = "/run/current-system/sw/bin/vhclient -n";
        Restart = "always";
        WorkingDirectory = "/run/current-system/sw/bin/";
        User = "root";
      };
    };

    # SERVER
    systemd.services.vhserver = lib.mkIf (cfg.server.enable && cfg.server.autostart) {
      description = "VirtualHere USB Server";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "forking";
        ExecStart = "/run/current-system/sw/bin/vhserver -b";
        Restart = "always";
        WorkingDirectory = "/run/current-system/sw/bin/";
        User = "root";
      };
    };

    networking.firewall.extraCommands = lib.mkIf cfg.server.enable ''
      iptables -A nixos-fw -p tcp --source 192.168.0.0/16 --dport 7575 -j nixos-fw-accept
    '';

    networking.firewall.extraStopCommands = lib.mkIf cfg.server.enable ''
      iptables -A nixos-fw -p tcp --source 192.168.0.0/16 --dport 7575 -j nixos-fw-accept || true
    '';
  };
}
