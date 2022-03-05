{
  description = ''Tales of Maj'Eyal addon manager'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."tam-master".type = "github";
  inputs."tam-master".owner = "riinr";
  inputs."tam-master".repo = "flake-nimble";
  inputs."tam-master".ref = "flake-pinning";
  inputs."tam-master".dir = "nimpkgs/t/tam/master";
  inputs."tam-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tam-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tam-v0_1_0".type = "github";
  inputs."tam-v0_1_0".owner = "riinr";
  inputs."tam-v0_1_0".repo = "flake-nimble";
  inputs."tam-v0_1_0".ref = "flake-pinning";
  inputs."tam-v0_1_0".dir = "nimpkgs/t/tam/v0_1_0";
  inputs."tam-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tam-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tam-v0_1_1".type = "github";
  inputs."tam-v0_1_1".owner = "riinr";
  inputs."tam-v0_1_1".repo = "flake-nimble";
  inputs."tam-v0_1_1".ref = "flake-pinning";
  inputs."tam-v0_1_1".dir = "nimpkgs/t/tam/v0_1_1";
  inputs."tam-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tam-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tam-v0_1_2".type = "github";
  inputs."tam-v0_1_2".owner = "riinr";
  inputs."tam-v0_1_2".repo = "flake-nimble";
  inputs."tam-v0_1_2".ref = "flake-pinning";
  inputs."tam-v0_1_2".dir = "nimpkgs/t/tam/v0_1_2";
  inputs."tam-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tam-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tam-v0_1_3".type = "github";
  inputs."tam-v0_1_3".owner = "riinr";
  inputs."tam-v0_1_3".repo = "flake-nimble";
  inputs."tam-v0_1_3".ref = "flake-pinning";
  inputs."tam-v0_1_3".dir = "nimpkgs/t/tam/v0_1_3";
  inputs."tam-v0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tam-v0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."tam-v0_1_4".type = "github";
  inputs."tam-v0_1_4".owner = "riinr";
  inputs."tam-v0_1_4".repo = "flake-nimble";
  inputs."tam-v0_1_4".ref = "flake-pinning";
  inputs."tam-v0_1_4".dir = "nimpkgs/t/tam/v0_1_4";
  inputs."tam-v0_1_4".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tam-v0_1_4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}