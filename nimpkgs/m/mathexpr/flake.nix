{
  description = ''MathExpr - pure-Nim mathematical expression evaluator library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."mathexpr-master".type = "github";
  inputs."mathexpr-master".owner = "riinr";
  inputs."mathexpr-master".repo = "flake-nimble";
  inputs."mathexpr-master".ref = "flake-pinning";
  inputs."mathexpr-master".dir = "nimpkgs/m/mathexpr/master";
  inputs."mathexpr-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mathexpr-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."mathexpr-1_2_0".type = "github";
  inputs."mathexpr-1_2_0".owner = "riinr";
  inputs."mathexpr-1_2_0".repo = "flake-nimble";
  inputs."mathexpr-1_2_0".ref = "flake-pinning";
  inputs."mathexpr-1_2_0".dir = "nimpkgs/m/mathexpr/1_2_0";
  inputs."mathexpr-1_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mathexpr-1_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."mathexpr-1_3_0".type = "github";
  inputs."mathexpr-1_3_0".owner = "riinr";
  inputs."mathexpr-1_3_0".repo = "flake-nimble";
  inputs."mathexpr-1_3_0".ref = "flake-pinning";
  inputs."mathexpr-1_3_0".dir = "nimpkgs/m/mathexpr/1_3_0";
  inputs."mathexpr-1_3_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mathexpr-1_3_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."mathexpr-1_3_1".type = "github";
  inputs."mathexpr-1_3_1".owner = "riinr";
  inputs."mathexpr-1_3_1".repo = "flake-nimble";
  inputs."mathexpr-1_3_1".ref = "flake-pinning";
  inputs."mathexpr-1_3_1".dir = "nimpkgs/m/mathexpr/1_3_1";
  inputs."mathexpr-1_3_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mathexpr-1_3_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."mathexpr-1_3_2".type = "github";
  inputs."mathexpr-1_3_2".owner = "riinr";
  inputs."mathexpr-1_3_2".repo = "flake-nimble";
  inputs."mathexpr-1_3_2".ref = "flake-pinning";
  inputs."mathexpr-1_3_2".dir = "nimpkgs/m/mathexpr/1_3_2";
  inputs."mathexpr-1_3_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mathexpr-1_3_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}