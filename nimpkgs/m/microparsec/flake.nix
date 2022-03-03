{
  description = ''A performant Nim parsing library built for humans.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."microparsec-master".type = "github";
  inputs."microparsec-master".owner = "riinr";
  inputs."microparsec-master".repo = "flake-nimble";
  inputs."microparsec-master".ref = "flake-pinning";
  inputs."microparsec-master".dir = "nimpkgs/m/microparsec/master";
  inputs."microparsec-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."microparsec-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."microparsec-v0_1-alpha".type = "github";
  inputs."microparsec-v0_1-alpha".owner = "riinr";
  inputs."microparsec-v0_1-alpha".repo = "flake-nimble";
  inputs."microparsec-v0_1-alpha".ref = "flake-pinning";
  inputs."microparsec-v0_1-alpha".dir = "nimpkgs/m/microparsec/v0_1-alpha";
  inputs."microparsec-v0_1-alpha".inputs.nixpkgs.follows = "nixpkgs";
  inputs."microparsec-v0_1-alpha".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}