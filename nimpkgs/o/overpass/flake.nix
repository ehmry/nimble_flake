{
  description = ''OpenStreetMap Overpass API Lib'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."overpass-master".type = "github";
  inputs."overpass-master".owner = "riinr";
  inputs."overpass-master".repo = "flake-nimble";
  inputs."overpass-master".ref = "flake-pinning";
  inputs."overpass-master".dir = "nimpkgs/o/overpass/master";
  inputs."overpass-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."overpass-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."overpass-0_0_1".type = "github";
  inputs."overpass-0_0_1".owner = "riinr";
  inputs."overpass-0_0_1".repo = "flake-nimble";
  inputs."overpass-0_0_1".ref = "flake-pinning";
  inputs."overpass-0_0_1".dir = "nimpkgs/o/overpass/0_0_1";
  inputs."overpass-0_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."overpass-0_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."overpass-0_2_5".type = "github";
  inputs."overpass-0_2_5".owner = "riinr";
  inputs."overpass-0_2_5".repo = "flake-nimble";
  inputs."overpass-0_2_5".ref = "flake-pinning";
  inputs."overpass-0_2_5".dir = "nimpkgs/o/overpass/0_2_5";
  inputs."overpass-0_2_5".inputs.nixpkgs.follows = "nixpkgs";
  inputs."overpass-0_2_5".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}