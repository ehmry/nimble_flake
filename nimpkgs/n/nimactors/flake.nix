{
  description = ''Actors library for Nim inspired by akka-actors'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."nimactors-master".type = "github";
  inputs."nimactors-master".owner = "riinr";
  inputs."nimactors-master".repo = "flake-nimble";
  inputs."nimactors-master".ref = "flake-pinning";
  inputs."nimactors-master".dir = "nimpkgs/n/nimactors/master";
  inputs."nimactors-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimactors-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."nimactors-v0_1_0".type = "github";
  inputs."nimactors-v0_1_0".owner = "riinr";
  inputs."nimactors-v0_1_0".repo = "flake-nimble";
  inputs."nimactors-v0_1_0".ref = "flake-pinning";
  inputs."nimactors-v0_1_0".dir = "nimpkgs/n/nimactors/v0_1_0";
  inputs."nimactors-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimactors-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}