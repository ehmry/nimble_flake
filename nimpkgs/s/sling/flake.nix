{
  description = ''Signal and Slot library for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."sling-master".type = "github";
  inputs."sling-master".owner = "riinr";
  inputs."sling-master".repo = "flake-nimble";
  inputs."sling-master".ref = "flake-pinning";
  inputs."sling-master".dir = "nimpkgs/s/sling/master";
  inputs."sling-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sling-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}