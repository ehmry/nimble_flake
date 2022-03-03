{
  description = ''A simple library to create queries in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."nery-main".type = "github";
  inputs."nery-main".owner = "riinr";
  inputs."nery-main".repo = "flake-nimble";
  inputs."nery-main".ref = "flake-pinning";
  inputs."nery-main".dir = "nimpkgs/n/nery/main";
  inputs."nery-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nery-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."nery-0_1_1".type = "github";
  inputs."nery-0_1_1".owner = "riinr";
  inputs."nery-0_1_1".repo = "flake-nimble";
  inputs."nery-0_1_1".ref = "flake-pinning";
  inputs."nery-0_1_1".dir = "nimpkgs/n/nery/0_1_1";
  inputs."nery-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nery-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}