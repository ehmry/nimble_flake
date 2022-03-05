{
  description = ''eachdo executes commands with each multidimensional values'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."eachdo-main".type = "github";
  inputs."eachdo-main".owner = "riinr";
  inputs."eachdo-main".repo = "flake-nimble";
  inputs."eachdo-main".ref = "flake-pinning";
  inputs."eachdo-main".dir = "nimpkgs/e/eachdo/main";
  inputs."eachdo-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."eachdo-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."eachdo-v0_1_0".type = "github";
  inputs."eachdo-v0_1_0".owner = "riinr";
  inputs."eachdo-v0_1_0".repo = "flake-nimble";
  inputs."eachdo-v0_1_0".ref = "flake-pinning";
  inputs."eachdo-v0_1_0".dir = "nimpkgs/e/eachdo/v0_1_0";
  inputs."eachdo-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."eachdo-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."eachdo-v0_1_1".type = "github";
  inputs."eachdo-v0_1_1".owner = "riinr";
  inputs."eachdo-v0_1_1".repo = "flake-nimble";
  inputs."eachdo-v0_1_1".ref = "flake-pinning";
  inputs."eachdo-v0_1_1".dir = "nimpkgs/e/eachdo/v0_1_1";
  inputs."eachdo-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."eachdo-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}