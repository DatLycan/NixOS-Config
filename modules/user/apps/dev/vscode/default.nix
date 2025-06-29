{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      vscode-fhs
    ];

    file.".config/Code/User/settings.json" = ./settings.json;
  };
}
