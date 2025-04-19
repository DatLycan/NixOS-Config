{
  lib,
  config,
  ...
}: let
  cfg = config.virtual-here-module;
in {
  options.virtual-here-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = false;
      };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.vhusbd = {
      description = "VirtualHere USB Server";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        ExecStart = "/usr/local/bin/vhusbd -b";
        Restart = "always";
        WorkingDirectory = "/usr/local/bin";
        User = "root";
      };
    };

    system.activationScripts.isntallVhusbd = {
      text = ''
        mkdir -p /usr/local/bin
        if [! -f /usr/local/bin/vhusbd ]; then
          wget -q -O /usr/local/bin/vhusbd https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64
          chmod +x /usr/local/bin/vhusbd
        fi
      '';
    };

    networking.firewall.extraRules = ''
      -A INPUT -p tcp -s 192.168.0.0/16 --dport 7575 -j ACCEPT
    '';
  };
}
