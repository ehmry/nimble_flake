{
  description = ''Fast and unsafe byte buffering for intensive network data transfer.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."netbuff-main".type = "github";
  inputs."netbuff-main".owner = "riinr";
  inputs."netbuff-main".repo = "flake-nimble";
  inputs."netbuff-main".ref = "flake-pinning";
  inputs."netbuff-main".dir = "nimpkgs/n/netbuff/main";
  inputs."netbuff-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."netbuff-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."netbuff-v0_1_0".type = "github";
  inputs."netbuff-v0_1_0".owner = "riinr";
  inputs."netbuff-v0_1_0".repo = "flake-nimble";
  inputs."netbuff-v0_1_0".ref = "flake-pinning";
  inputs."netbuff-v0_1_0".dir = "nimpkgs/n/netbuff/v0_1_0";
  inputs."netbuff-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."netbuff-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."netbuff-v0_1_1".type = "github";
  inputs."netbuff-v0_1_1".owner = "riinr";
  inputs."netbuff-v0_1_1".repo = "flake-nimble";
  inputs."netbuff-v0_1_1".ref = "flake-pinning";
  inputs."netbuff-v0_1_1".dir = "nimpkgs/n/netbuff/v0_1_1";
  inputs."netbuff-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."netbuff-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}