{
  description = ''Bass wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."nimbass-master".type = "github";
  inputs."nimbass-master".owner = "riinr";
  inputs."nimbass-master".repo = "flake-nimble";
  inputs."nimbass-master".ref = "flake-pinning";
  inputs."nimbass-master".dir = "nimpkgs/n/nimbass/master";
  inputs."nimbass-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimbass-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."nimbass-v0_1_0".type = "github";
  inputs."nimbass-v0_1_0".owner = "riinr";
  inputs."nimbass-v0_1_0".repo = "flake-nimble";
  inputs."nimbass-v0_1_0".ref = "flake-pinning";
  inputs."nimbass-v0_1_0".dir = "nimpkgs/n/nimbass/v0_1_0";
  inputs."nimbass-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimbass-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."nimbass-v0_1_2".type = "github";
  inputs."nimbass-v0_1_2".owner = "riinr";
  inputs."nimbass-v0_1_2".repo = "flake-nimble";
  inputs."nimbass-v0_1_2".ref = "flake-pinning";
  inputs."nimbass-v0_1_2".dir = "nimpkgs/n/nimbass/v0_1_2";
  inputs."nimbass-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimbass-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."nimbass-v0_1_3".type = "github";
  inputs."nimbass-v0_1_3".owner = "riinr";
  inputs."nimbass-v0_1_3".repo = "flake-nimble";
  inputs."nimbass-v0_1_3".ref = "flake-pinning";
  inputs."nimbass-v0_1_3".dir = "nimpkgs/n/nimbass/v0_1_3";
  inputs."nimbass-v0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimbass-v0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."nimbass-v0_2_0".type = "github";
  inputs."nimbass-v0_2_0".owner = "riinr";
  inputs."nimbass-v0_2_0".repo = "flake-nimble";
  inputs."nimbass-v0_2_0".ref = "flake-pinning";
  inputs."nimbass-v0_2_0".dir = "nimpkgs/n/nimbass/v0_2_0";
  inputs."nimbass-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimbass-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}