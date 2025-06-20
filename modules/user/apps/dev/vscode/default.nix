{pkgs, ...}: {
  programs.vscode = {
    enable = false;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      csharpier.csharpier-vscode
    ];
  };
}
