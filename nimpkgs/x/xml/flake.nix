{
  description = ''Pure Nim XML parser'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."xml-master".type = "github";
  inputs."xml-master".owner = "riinr";
  inputs."xml-master".repo = "flake-nimble";
  inputs."xml-master".ref = "flake-pinning";
  inputs."xml-master".dir = "nimpkgs/x/xml/master";
  inputs."xml-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."xml-0_1_0".type = "github";
  inputs."xml-0_1_0".owner = "riinr";
  inputs."xml-0_1_0".repo = "flake-nimble";
  inputs."xml-0_1_0".ref = "flake-pinning";
  inputs."xml-0_1_0".dir = "nimpkgs/x/xml/0_1_0";
  inputs."xml-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."xml-0_1_1".type = "github";
  inputs."xml-0_1_1".owner = "riinr";
  inputs."xml-0_1_1".repo = "flake-nimble";
  inputs."xml-0_1_1".ref = "flake-pinning";
  inputs."xml-0_1_1".dir = "nimpkgs/x/xml/0_1_1";
  inputs."xml-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."xml-0_1_2".type = "github";
  inputs."xml-0_1_2".owner = "riinr";
  inputs."xml-0_1_2".repo = "flake-nimble";
  inputs."xml-0_1_2".ref = "flake-pinning";
  inputs."xml-0_1_2".dir = "nimpkgs/x/xml/0_1_2";
  inputs."xml-0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."xml-0_1_3".type = "github";
  inputs."xml-0_1_3".owner = "riinr";
  inputs."xml-0_1_3".repo = "flake-nimble";
  inputs."xml-0_1_3".ref = "flake-pinning";
  inputs."xml-0_1_3".dir = "nimpkgs/x/xml/0_1_3";
  inputs."xml-0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."xml-0_1_4".type = "github";
  inputs."xml-0_1_4".owner = "riinr";
  inputs."xml-0_1_4".repo = "flake-nimble";
  inputs."xml-0_1_4".ref = "flake-pinning";
  inputs."xml-0_1_4".dir = "nimpkgs/x/xml/0_1_4";
  inputs."xml-0_1_4".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-0_1_4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."xml-devel".type = "github";
  inputs."xml-devel".owner = "riinr";
  inputs."xml-devel".repo = "flake-nimble";
  inputs."xml-devel".ref = "flake-pinning";
  inputs."xml-devel".dir = "nimpkgs/x/xml/devel";
  inputs."xml-devel".inputs.nixpkgs.follows = "nixpkgs";
  inputs."xml-devel".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}