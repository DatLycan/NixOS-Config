{ pkgs, ... }:

{
  imports =
    [ 
      ./system/default-user.nix
      ./system/hyprland.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    nh
    neovim 
    wget
    git
    nix-ld
    nil
  ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "no";
    };
  };

    #TODO: REMOVE!!
    system.activationScripts.foo_home_read = pkgs.lib.stringAfter [ "users" ]
    ''
      chmod g+rx /etc/nixos
    '';

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
