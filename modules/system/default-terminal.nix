{ lib, config, pkgs, ... }:

let 
  cfg = config.default-terminal;
in
{
  options.default-terminal = {
    enable = lib.mkEnableOption "Enable default-terminal" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        fish
      ];
    };

    programs.fish = {
      enable = true;

      shellAliases = {
        ".." = "cd ..";
		    "..." = "cd ../..";
		    "...." = "cd ../../../";
      };

      shellAbbrs = {
        ncc = "nix-store --gc";
        nr = "sudo nixos-rebuild switch --flake /etc/nixos";
	    };
    };

    users.defaultUserShell = pkgs.fish;
  };
}
