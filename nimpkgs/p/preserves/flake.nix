{
  description = ''Preserves data model and serialization format'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
    inputs."preserves-v0_1_0".type = "github";
  inputs."preserves-v0_1_0".owner = "riinr";
  inputs."preserves-v0_1_0".repo = "flake-nimble";
  inputs."preserves-v0_1_0".ref = "flake-pinning";
  inputs."preserves-v0_1_0".dir = "nimpkgs/p/preserves/v0_1_0";
  inputs."preserves-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v0_2_0".type = "github";
  inputs."preserves-v0_2_0".owner = "riinr";
  inputs."preserves-v0_2_0".repo = "flake-nimble";
  inputs."preserves-v0_2_0".ref = "flake-pinning";
  inputs."preserves-v0_2_0".dir = "nimpkgs/p/preserves/v0_2_0";
  inputs."preserves-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v1_0_0".type = "github";
  inputs."preserves-v1_0_0".owner = "riinr";
  inputs."preserves-v1_0_0".repo = "flake-nimble";
  inputs."preserves-v1_0_0".ref = "flake-pinning";
  inputs."preserves-v1_0_0".dir = "nimpkgs/p/preserves/v1_0_0";
  inputs."preserves-v1_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v1_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v1_1_0".type = "github";
  inputs."preserves-v1_1_0".owner = "riinr";
  inputs."preserves-v1_1_0".repo = "flake-nimble";
  inputs."preserves-v1_1_0".ref = "flake-pinning";
  inputs."preserves-v1_1_0".dir = "nimpkgs/p/preserves/v1_1_0";
  inputs."preserves-v1_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v1_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v2_0_0".type = "github";
  inputs."preserves-v2_0_0".owner = "riinr";
  inputs."preserves-v2_0_0".repo = "flake-nimble";
  inputs."preserves-v2_0_0".ref = "flake-pinning";
  inputs."preserves-v2_0_0".dir = "nimpkgs/p/preserves/v2_0_0";
  inputs."preserves-v2_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v2_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v3_0_0".type = "github";
  inputs."preserves-v3_0_0".owner = "riinr";
  inputs."preserves-v3_0_0".repo = "flake-nimble";
  inputs."preserves-v3_0_0".ref = "flake-pinning";
  inputs."preserves-v3_0_0".dir = "nimpkgs/p/preserves/v3_0_0";
  inputs."preserves-v3_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v3_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v3_0_1".type = "github";
  inputs."preserves-v3_0_1".owner = "riinr";
  inputs."preserves-v3_0_1".repo = "flake-nimble";
  inputs."preserves-v3_0_1".ref = "flake-pinning";
  inputs."preserves-v3_0_1".dir = "nimpkgs/p/preserves/v3_0_1";
  inputs."preserves-v3_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v3_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."preserves-v3_1_0".type = "github";
  inputs."preserves-v3_1_0".owner = "riinr";
  inputs."preserves-v3_1_0".repo = "flake-nimble";
  inputs."preserves-v3_1_0".ref = "flake-pinning";
  inputs."preserves-v3_1_0".dir = "nimpkgs/p/preserves/v3_1_0";
  inputs."preserves-v3_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."preserves-v3_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}