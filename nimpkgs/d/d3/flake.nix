{
  description = ''A D3.js wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."d3-master".type = "github";
  inputs."d3-master".owner = "riinr";
  inputs."d3-master".repo = "flake-nimble";
  inputs."d3-master".ref = "flake-pinning";
  inputs."d3-master".dir = "nimpkgs/d/d3/master";
  inputs."d3-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."d3-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."d3-v0_1_0".type = "github";
  inputs."d3-v0_1_0".owner = "riinr";
  inputs."d3-v0_1_0".repo = "flake-nimble";
  inputs."d3-v0_1_0".ref = "flake-pinning";
  inputs."d3-v0_1_0".dir = "nimpkgs/d/d3/v0_1_0";
  inputs."d3-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."d3-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."d3-v0_1_1".type = "github";
  inputs."d3-v0_1_1".owner = "riinr";
  inputs."d3-v0_1_1".repo = "flake-nimble";
  inputs."d3-v0_1_1".ref = "flake-pinning";
  inputs."d3-v0_1_1".dir = "nimpkgs/d/d3/v0_1_1";
  inputs."d3-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."d3-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."d3-v0_1_2".type = "github";
  inputs."d3-v0_1_2".owner = "riinr";
  inputs."d3-v0_1_2".repo = "flake-nimble";
  inputs."d3-v0_1_2".ref = "flake-pinning";
  inputs."d3-v0_1_2".dir = "nimpkgs/d/d3/v0_1_2";
  inputs."d3-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."d3-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."d3-v0_1_3".type = "github";
  inputs."d3-v0_1_3".owner = "riinr";
  inputs."d3-v0_1_3".repo = "flake-nimble";
  inputs."d3-v0_1_3".ref = "flake-pinning";
  inputs."d3-v0_1_3".dir = "nimpkgs/d/d3/v0_1_3";
  inputs."d3-v0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."d3-v0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}