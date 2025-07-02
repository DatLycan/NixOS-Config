{pkgs, ...}: {
  imports = [
    ./vscode
  ];

  home.packages = with pkgs; [
    dotnet-sdk
    dotnetPackages.Nuget
    csharpier
    csharprepl
    docker
  ];
}
