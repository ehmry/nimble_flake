{
  description = ''Morepretty - Does more than nimpretty.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."morepretty-master".type = "github";
  inputs."morepretty-master".owner = "riinr";
  inputs."morepretty-master".repo = "flake-nimble";
  inputs."morepretty-master".ref = "flake-pinning";
  inputs."morepretty-master".dir = "nimpkgs/m/morepretty/master";
  inputs."morepretty-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."morepretty-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."morepretty-0_1_0".type = "github";
  inputs."morepretty-0_1_0".owner = "riinr";
  inputs."morepretty-0_1_0".repo = "flake-nimble";
  inputs."morepretty-0_1_0".ref = "flake-pinning";
  inputs."morepretty-0_1_0".dir = "nimpkgs/m/morepretty/0_1_0";
  inputs."morepretty-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."morepretty-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}