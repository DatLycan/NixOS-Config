{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      vscode-fhs
    ];

    # file.".config/Code/User/settings.json".text = builtins.readFile ./settings.json;
    # file.".config/Code/User/keybindings.json".text = builtins.readFile ./keybindings.json;
  };
}
