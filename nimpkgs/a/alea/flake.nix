{
  description = ''Define and compose random variables'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."alea-master".type = "github";
  inputs."alea-master".owner = "riinr";
  inputs."alea-master".repo = "flake-nimble";
  inputs."alea-master".ref = "flake-pinning";
  inputs."alea-master".dir = "nimpkgs/a/alea/master";
  inputs."alea-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."alea-0_1_0".type = "github";
  inputs."alea-0_1_0".owner = "riinr";
  inputs."alea-0_1_0".repo = "flake-nimble";
  inputs."alea-0_1_0".ref = "flake-pinning";
  inputs."alea-0_1_0".dir = "nimpkgs/a/alea/0_1_0";
  inputs."alea-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."alea-0_1_1".type = "github";
  inputs."alea-0_1_1".owner = "riinr";
  inputs."alea-0_1_1".repo = "flake-nimble";
  inputs."alea-0_1_1".ref = "flake-pinning";
  inputs."alea-0_1_1".dir = "nimpkgs/a/alea/0_1_1";
  inputs."alea-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."alea-0_1_2".type = "github";
  inputs."alea-0_1_2".owner = "riinr";
  inputs."alea-0_1_2".repo = "flake-nimble";
  inputs."alea-0_1_2".ref = "flake-pinning";
  inputs."alea-0_1_2".dir = "nimpkgs/a/alea/0_1_2";
  inputs."alea-0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."alea-0_1_3".type = "github";
  inputs."alea-0_1_3".owner = "riinr";
  inputs."alea-0_1_3".repo = "flake-nimble";
  inputs."alea-0_1_3".ref = "flake-pinning";
  inputs."alea-0_1_3".dir = "nimpkgs/a/alea/0_1_3";
  inputs."alea-0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."alea-0_1_4".type = "github";
  inputs."alea-0_1_4".owner = "riinr";
  inputs."alea-0_1_4".repo = "flake-nimble";
  inputs."alea-0_1_4".ref = "flake-pinning";
  inputs."alea-0_1_4".dir = "nimpkgs/a/alea/0_1_4";
  inputs."alea-0_1_4".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-0_1_4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."alea-0_1_5".type = "github";
  inputs."alea-0_1_5".owner = "riinr";
  inputs."alea-0_1_5".repo = "flake-nimble";
  inputs."alea-0_1_5".ref = "flake-pinning";
  inputs."alea-0_1_5".dir = "nimpkgs/a/alea/0_1_5";
  inputs."alea-0_1_5".inputs.nixpkgs.follows = "nixpkgs";
  inputs."alea-0_1_5".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}