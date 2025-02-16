{ pkgs, version, ... }:

{
  imports =
    [ 
      ./system/default-user.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    pkgs.neovim 
    pkgs.curl
    pkgs.wget
    pkgs.git
    pkgs.nix-ld
    pkgs.nil
    pkgs.hyprland
  ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "yes";
    };
  };

    #TODO: REMOVE!!
    system.activationScripts.foo_home_read = pkgs.lib.stringAfter [ "users" ]
    ''
      chmod g+rx /etc/nixos
    '';

  programs.hyprland.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = version;
}
