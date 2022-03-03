{
  description = ''Tiger hash function'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."tiger-master".type = "github";
  inputs."tiger-master".owner = "riinr";
  inputs."tiger-master".repo = "flake-nimble";
  inputs."tiger-master".ref = "flake-pinning";
  inputs."tiger-master".dir = "nimpkgs/t/tiger/master";
  inputs."tiger-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tiger-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tiger-v0_1".type = "github";
  inputs."tiger-v0_1".owner = "riinr";
  inputs."tiger-v0_1".repo = "flake-nimble";
  inputs."tiger-v0_1".ref = "flake-pinning";
  inputs."tiger-v0_1".dir = "nimpkgs/t/tiger/v0_1";
  inputs."tiger-v0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tiger-v0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tiger-v0_2".type = "github";
  inputs."tiger-v0_2".owner = "riinr";
  inputs."tiger-v0_2".repo = "flake-nimble";
  inputs."tiger-v0_2".ref = "flake-pinning";
  inputs."tiger-v0_2".dir = "nimpkgs/t/tiger/v0_2";
  inputs."tiger-v0_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tiger-v0_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tiger-v0_2_1".type = "github";
  inputs."tiger-v0_2_1".owner = "riinr";
  inputs."tiger-v0_2_1".repo = "flake-nimble";
  inputs."tiger-v0_2_1".ref = "flake-pinning";
  inputs."tiger-v0_2_1".dir = "nimpkgs/t/tiger/v0_2_1";
  inputs."tiger-v0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tiger-v0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}