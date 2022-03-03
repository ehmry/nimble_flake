{
  description = ''Low-level twitter API wrapper library for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."twitter-master".type = "github";
  inputs."twitter-master".owner = "riinr";
  inputs."twitter-master".repo = "flake-nimble";
  inputs."twitter-master".ref = "flake-pinning";
  inputs."twitter-master".dir = "nimpkgs/t/twitter/master";
  inputs."twitter-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."twitter-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."twitter-1_0_0".type = "github";
  inputs."twitter-1_0_0".owner = "riinr";
  inputs."twitter-1_0_0".repo = "flake-nimble";
  inputs."twitter-1_0_0".ref = "flake-pinning";
  inputs."twitter-1_0_0".dir = "nimpkgs/t/twitter/1_0_0";
  inputs."twitter-1_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."twitter-1_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."twitter-1_0_1".type = "github";
  inputs."twitter-1_0_1".owner = "riinr";
  inputs."twitter-1_0_1".repo = "flake-nimble";
  inputs."twitter-1_0_1".ref = "flake-pinning";
  inputs."twitter-1_0_1".dir = "nimpkgs/t/twitter/1_0_1";
  inputs."twitter-1_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."twitter-1_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}