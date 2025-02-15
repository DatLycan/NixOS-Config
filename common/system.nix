{ ... }:

let systemModulesDir = "../modules/system";
in
{
  imports =
    [ 
      "${systemModulesDir}/default-user.nix"
    ];
}
