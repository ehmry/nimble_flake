{
  description = ''A SIMD-accelerated vector library written in C99 with Nim bindings.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."sol-master".type = "github";
  inputs."sol-master".owner = "riinr";
  inputs."sol-master".repo = "flake-nimble";
  inputs."sol-master".ref = "flake-pinning";
  inputs."sol-master".dir = "nimpkgs/s/sol/master";
  inputs."sol-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sol-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}