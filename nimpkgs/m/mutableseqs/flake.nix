{
  description = ''utilities for transforming sequences'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."mutableseqs-master".type = "github";
  inputs."mutableseqs-master".owner = "riinr";
  inputs."mutableseqs-master".repo = "flake-nimble";
  inputs."mutableseqs-master".ref = "flake-pinning";
  inputs."mutableseqs-master".dir = "nimpkgs/m/mutableseqs/master";
  inputs."mutableseqs-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mutableseqs-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}