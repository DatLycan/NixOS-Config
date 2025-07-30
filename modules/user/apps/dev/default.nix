{pkgs, ...}: {
  imports = [
    ./vscode
  ];

  home.packages = with pkgs; [
    dotnetCorePackages.sdk_8_0_1xx-bin
    dotnetPackages.Nuget
    csharpier
    csharprepl
  ];
}
