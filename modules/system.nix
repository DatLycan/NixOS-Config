{ pkgs, version, ... }:

{
  imports =
    [ 
      ./system/default-user.nix
      ./system/system-security.nix
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
    fish
    yazi
    neovim 
    curl
    wget
    git
    nix-ld
  ];

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = version;
}
