{
  description = ''This module performs character tests.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."asciitype-master".type = "github";
  inputs."asciitype-master".owner = "riinr";
  inputs."asciitype-master".repo = "flake-nimble";
  inputs."asciitype-master".ref = "flake-pinning";
  inputs."asciitype-master".dir = "nimpkgs/a/asciitype/master";
  inputs."asciitype-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."asciitype-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}