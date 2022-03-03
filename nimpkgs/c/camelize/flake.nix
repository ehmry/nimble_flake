{
  description = ''Convert json node to camelcase'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."camelize-master".type = "github";
  inputs."camelize-master".owner = "riinr";
  inputs."camelize-master".repo = "flake-nimble";
  inputs."camelize-master".ref = "flake-pinning";
  inputs."camelize-master".dir = "nimpkgs/c/camelize/master";
  inputs."camelize-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."camelize-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."camelize-v0_1_0".type = "github";
  inputs."camelize-v0_1_0".owner = "riinr";
  inputs."camelize-v0_1_0".repo = "flake-nimble";
  inputs."camelize-v0_1_0".ref = "flake-pinning";
  inputs."camelize-v0_1_0".dir = "nimpkgs/c/camelize/v0_1_0";
  inputs."camelize-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."camelize-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."camelize-v0_2_0".type = "github";
  inputs."camelize-v0_2_0".owner = "riinr";
  inputs."camelize-v0_2_0".repo = "flake-nimble";
  inputs."camelize-v0_2_0".ref = "flake-pinning";
  inputs."camelize-v0_2_0".dir = "nimpkgs/c/camelize/v0_2_0";
  inputs."camelize-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."camelize-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."camelize-v0_2_1".type = "github";
  inputs."camelize-v0_2_1".owner = "riinr";
  inputs."camelize-v0_2_1".repo = "flake-nimble";
  inputs."camelize-v0_2_1".ref = "flake-pinning";
  inputs."camelize-v0_2_1".dir = "nimpkgs/c/camelize/v0_2_1";
  inputs."camelize-v0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."camelize-v0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}