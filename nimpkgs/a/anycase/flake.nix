{
  description = ''Convert strings to any case'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."anycase-master".type = "github";
  inputs."anycase-master".owner = "riinr";
  inputs."anycase-master".repo = "flake-nimble";
  inputs."anycase-master".ref = "flake-pinning";
  inputs."anycase-master".dir = "nimpkgs/a/anycase/master";
  inputs."anycase-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."anycase-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."anycase-v0_1_0".type = "github";
  inputs."anycase-v0_1_0".owner = "riinr";
  inputs."anycase-v0_1_0".repo = "flake-nimble";
  inputs."anycase-v0_1_0".ref = "flake-pinning";
  inputs."anycase-v0_1_0".dir = "nimpkgs/a/anycase/v0_1_0";
  inputs."anycase-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."anycase-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."anycase-v0_1_1".type = "github";
  inputs."anycase-v0_1_1".owner = "riinr";
  inputs."anycase-v0_1_1".repo = "flake-nimble";
  inputs."anycase-v0_1_1".ref = "flake-pinning";
  inputs."anycase-v0_1_1".dir = "nimpkgs/a/anycase/v0_1_1";
  inputs."anycase-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."anycase-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}