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
    
      variables.EDITOR = "neovim";
    };

    programs.bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    programs.fish = {
      enable = true;

      shellAliases = {
        ".." = "cd ..";
		    "..." = "cd ../..";
		    "...." = "cd ../../../";
		    "....." = "cd ../../../../";
      };

      shellAbbrs = {
        # General Abbreviations
        rb = "reboot";
        # Nix abbreviations
        ncc = "nix-store --gc";
        nrd = "sudo nixos-rebuild switch --flake /etc/nixos";
	    };
    };
  };
}
