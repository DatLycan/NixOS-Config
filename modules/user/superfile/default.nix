{ pkgs, ...}:

{
  home = {
    packages = with pkgs; [
      superfile
    ];

    file = {
      "./config.toml".source = ~/.config/superfile/config.toml;
      "./hotkeys.toml".source = ~/.config/superfile/hotkeys.toml;
    }; 
  };
}
