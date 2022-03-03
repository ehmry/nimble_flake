{
  description = ''Low level wrapper for the fontconfig library.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."fontconfig-master".type = "github";
  inputs."fontconfig-master".owner = "riinr";
  inputs."fontconfig-master".repo = "flake-nimble";
  inputs."fontconfig-master".ref = "flake-pinning";
  inputs."fontconfig-master".dir = "nimpkgs/f/fontconfig/master";
  inputs."fontconfig-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."fontconfig-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}