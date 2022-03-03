{
  description = ''Nim binding to libfswatch'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."libfswatch-master".type = "github";
  inputs."libfswatch-master".owner = "riinr";
  inputs."libfswatch-master".repo = "flake-nimble";
  inputs."libfswatch-master".ref = "flake-pinning";
  inputs."libfswatch-master".dir = "nimpkgs/l/libfswatch/master";
  inputs."libfswatch-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."libfswatch-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}