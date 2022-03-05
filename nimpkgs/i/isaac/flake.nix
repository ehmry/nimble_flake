{
  description = ''ISAAC PRNG implementation on Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."isaac-master".type = "github";
  inputs."isaac-master".owner = "riinr";
  inputs."isaac-master".repo = "flake-nimble";
  inputs."isaac-master".ref = "flake-pinning";
  inputs."isaac-master".dir = "nimpkgs/i/isaac/master";
  inputs."isaac-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."isaac-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."isaac-v0_1_1".type = "github";
  inputs."isaac-v0_1_1".owner = "riinr";
  inputs."isaac-v0_1_1".repo = "flake-nimble";
  inputs."isaac-v0_1_1".ref = "flake-pinning";
  inputs."isaac-v0_1_1".dir = "nimpkgs/i/isaac/v0_1_1";
  inputs."isaac-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."isaac-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."isaac-v0_1_2".type = "github";
  inputs."isaac-v0_1_2".owner = "riinr";
  inputs."isaac-v0_1_2".repo = "flake-nimble";
  inputs."isaac-v0_1_2".ref = "flake-pinning";
  inputs."isaac-v0_1_2".dir = "nimpkgs/i/isaac/v0_1_2";
  inputs."isaac-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."isaac-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."isaac-v0_1_3".type = "github";
  inputs."isaac-v0_1_3".owner = "riinr";
  inputs."isaac-v0_1_3".repo = "flake-nimble";
  inputs."isaac-v0_1_3".ref = "flake-pinning";
  inputs."isaac-v0_1_3".dir = "nimpkgs/i/isaac/v0_1_3";
  inputs."isaac-v0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."isaac-v0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}