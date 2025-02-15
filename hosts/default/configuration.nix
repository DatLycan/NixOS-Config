# ╔════════════════════════╗
# ║    General Settings    ║
# ╚════════════════════════╝

{ pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix # Include the results of the hardware scan.
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  networking.hostName = "nixos-personal"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.datlycan = {
    isNormalUser = true;
    description = "DatLycan";
    extraGroups = [ "networkmanager" "wheel" "video" "audio"];
  };

  security.sudo.extraRules = [{
    users = ["datlycan"];
    commands = [{
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
     neovim 
     wget
     git
     nix-ld
     nil
  ];

  programs.nix-ld.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  # services.getty.autologinUser = "datlycan";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
