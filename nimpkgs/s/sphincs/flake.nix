{
  description = ''SPHINCS⁺ stateless hash-based signature scheme'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."sphincs-master".type = "github";
  inputs."sphincs-master".owner = "riinr";
  inputs."sphincs-master".repo = "flake-nimble";
  inputs."sphincs-master".ref = "flake-pinning";
  inputs."sphincs-master".dir = "nimpkgs/s/sphincs/master";
  inputs."sphincs-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sphincs-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."sphincs-v0_1_0".type = "github";
  inputs."sphincs-v0_1_0".owner = "riinr";
  inputs."sphincs-v0_1_0".repo = "flake-nimble";
  inputs."sphincs-v0_1_0".ref = "flake-pinning";
  inputs."sphincs-v0_1_0".dir = "nimpkgs/s/sphincs/v0_1_0";
  inputs."sphincs-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sphincs-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."sphincs-v0_1_1".type = "github";
  inputs."sphincs-v0_1_1".owner = "riinr";
  inputs."sphincs-v0_1_1".repo = "flake-nimble";
  inputs."sphincs-v0_1_1".ref = "flake-pinning";
  inputs."sphincs-v0_1_1".dir = "nimpkgs/s/sphincs/v0_1_1";
  inputs."sphincs-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sphincs-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}