{
  description = ''Decimal type support based on the IEEE 754 2008 specification.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."decimal128-master".type = "github";
  inputs."decimal128-master".owner = "riinr";
  inputs."decimal128-master".repo = "flake-nimble";
  inputs."decimal128-master".ref = "flake-pinning";
  inputs."decimal128-master".dir = "nimpkgs/d/decimal128/master";
  inputs."decimal128-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."decimal128-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."decimal128-v0_1_0".type = "github";
  inputs."decimal128-v0_1_0".owner = "riinr";
  inputs."decimal128-v0_1_0".repo = "flake-nimble";
  inputs."decimal128-v0_1_0".ref = "flake-pinning";
  inputs."decimal128-v0_1_0".dir = "nimpkgs/d/decimal128/v0_1_0";
  inputs."decimal128-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."decimal128-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."decimal128-v0_1_1".type = "github";
  inputs."decimal128-v0_1_1".owner = "riinr";
  inputs."decimal128-v0_1_1".repo = "flake-nimble";
  inputs."decimal128-v0_1_1".ref = "flake-pinning";
  inputs."decimal128-v0_1_1".dir = "nimpkgs/d/decimal128/v0_1_1";
  inputs."decimal128-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."decimal128-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."decimal128-v0_1_2".type = "github";
  inputs."decimal128-v0_1_2".owner = "riinr";
  inputs."decimal128-v0_1_2".repo = "flake-nimble";
  inputs."decimal128-v0_1_2".ref = "flake-pinning";
  inputs."decimal128-v0_1_2".dir = "nimpkgs/d/decimal128/v0_1_2";
  inputs."decimal128-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."decimal128-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}