{
  description = ''Text string translation from free online crowdsourced API. Tinyslation a tiny translation.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."translation-master".type = "github";
  inputs."translation-master".owner = "riinr";
  inputs."translation-master".repo = "flake-nimble";
  inputs."translation-master".ref = "flake-pinning";
  inputs."translation-master".dir = "nimpkgs/t/translation/master";
  inputs."translation-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."translation-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."translation-0_2_0".type = "github";
  inputs."translation-0_2_0".owner = "riinr";
  inputs."translation-0_2_0".repo = "flake-nimble";
  inputs."translation-0_2_0".ref = "flake-pinning";
  inputs."translation-0_2_0".dir = "nimpkgs/t/translation/0_2_0";
  inputs."translation-0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."translation-0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."translation-0_3_1".type = "github";
  inputs."translation-0_3_1".owner = "riinr";
  inputs."translation-0_3_1".repo = "flake-nimble";
  inputs."translation-0_3_1".ref = "flake-pinning";
  inputs."translation-0_3_1".dir = "nimpkgs/t/translation/0_3_1";
  inputs."translation-0_3_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."translation-0_3_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."translation-v0_1_0".type = "github";
  inputs."translation-v0_1_0".owner = "riinr";
  inputs."translation-v0_1_0".repo = "flake-nimble";
  inputs."translation-v0_1_0".ref = "flake-pinning";
  inputs."translation-v0_1_0".dir = "nimpkgs/t/translation/v0_1_0";
  inputs."translation-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."translation-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}