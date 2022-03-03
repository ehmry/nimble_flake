{
  description = ''Experimental wrapper to webgl for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."webgl-master".type = "github";
  inputs."webgl-master".owner = "riinr";
  inputs."webgl-master".repo = "flake-nimble";
  inputs."webgl-master".ref = "flake-pinning";
  inputs."webgl-master".dir = "nimpkgs/w/webgl/master";
  inputs."webgl-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."webgl-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."webgl-0_1_0".type = "github";
  inputs."webgl-0_1_0".owner = "riinr";
  inputs."webgl-0_1_0".repo = "flake-nimble";
  inputs."webgl-0_1_0".ref = "flake-pinning";
  inputs."webgl-0_1_0".dir = "nimpkgs/w/webgl/0_1_0";
  inputs."webgl-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."webgl-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."webgl-0_1_2".type = "github";
  inputs."webgl-0_1_2".owner = "riinr";
  inputs."webgl-0_1_2".repo = "flake-nimble";
  inputs."webgl-0_1_2".ref = "flake-pinning";
  inputs."webgl-0_1_2".dir = "nimpkgs/w/webgl/0_1_2";
  inputs."webgl-0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."webgl-0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."webgl-0_2_0".type = "github";
  inputs."webgl-0_2_0".owner = "riinr";
  inputs."webgl-0_2_0".repo = "flake-nimble";
  inputs."webgl-0_2_0".ref = "flake-pinning";
  inputs."webgl-0_2_0".dir = "nimpkgs/w/webgl/0_2_0";
  inputs."webgl-0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."webgl-0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."webgl-0_2_1".type = "github";
  inputs."webgl-0_2_1".owner = "riinr";
  inputs."webgl-0_2_1".repo = "flake-nimble";
  inputs."webgl-0_2_1".ref = "flake-pinning";
  inputs."webgl-0_2_1".dir = "nimpkgs/w/webgl/0_2_1";
  inputs."webgl-0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."webgl-0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}