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
        curl
      ];
    
      variables.EDITOR = "neovim";
    };

    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = true;
  };
}
