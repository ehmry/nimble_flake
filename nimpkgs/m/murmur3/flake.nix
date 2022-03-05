{
  description = ''A simple MurmurHash3 wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."murmur3-master".type = "github";
  inputs."murmur3-master".owner = "riinr";
  inputs."murmur3-master".repo = "flake-nimble";
  inputs."murmur3-master".ref = "flake-pinning";
  inputs."murmur3-master".dir = "nimpkgs/m/murmur3/master";
  inputs."murmur3-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmur3-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."murmur3-v0_1_0".type = "github";
  inputs."murmur3-v0_1_0".owner = "riinr";
  inputs."murmur3-v0_1_0".repo = "flake-nimble";
  inputs."murmur3-v0_1_0".ref = "flake-pinning";
  inputs."murmur3-v0_1_0".dir = "nimpkgs/m/murmur3/v0_1_0";
  inputs."murmur3-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmur3-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."murmur3-v0_1_1".type = "github";
  inputs."murmur3-v0_1_1".owner = "riinr";
  inputs."murmur3-v0_1_1".repo = "flake-nimble";
  inputs."murmur3-v0_1_1".ref = "flake-pinning";
  inputs."murmur3-v0_1_1".dir = "nimpkgs/m/murmur3/v0_1_1";
  inputs."murmur3-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmur3-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."murmur3-v0_1_2".type = "github";
  inputs."murmur3-v0_1_2".owner = "riinr";
  inputs."murmur3-v0_1_2".repo = "flake-nimble";
  inputs."murmur3-v0_1_2".ref = "flake-pinning";
  inputs."murmur3-v0_1_2".dir = "nimpkgs/m/murmur3/v0_1_2";
  inputs."murmur3-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmur3-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."murmur3-v0_1_3".type = "github";
  inputs."murmur3-v0_1_3".owner = "riinr";
  inputs."murmur3-v0_1_3".repo = "flake-nimble";
  inputs."murmur3-v0_1_3".ref = "flake-pinning";
  inputs."murmur3-v0_1_3".dir = "nimpkgs/m/murmur3/v0_1_3";
  inputs."murmur3-v0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmur3-v0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."murmur3-v0_2_0".type = "github";
  inputs."murmur3-v0_2_0".owner = "riinr";
  inputs."murmur3-v0_2_0".repo = "flake-nimble";
  inputs."murmur3-v0_2_0".ref = "flake-pinning";
  inputs."murmur3-v0_2_0".dir = "nimpkgs/m/murmur3/v0_2_0";
  inputs."murmur3-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmur3-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}