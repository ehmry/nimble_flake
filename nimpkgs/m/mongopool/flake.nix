{
  description = ''MongoDb pooled driver'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."mongopool-master".type = "github";
  inputs."mongopool-master".owner = "riinr";
  inputs."mongopool-master".repo = "flake-nimble";
  inputs."mongopool-master".ref = "flake-pinning";
  inputs."mongopool-master".dir = "nimpkgs/m/mongopool/master";
  inputs."mongopool-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mongopool-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."mongopool-v1_0_0".type = "github";
  inputs."mongopool-v1_0_0".owner = "riinr";
  inputs."mongopool-v1_0_0".repo = "flake-nimble";
  inputs."mongopool-v1_0_0".ref = "flake-pinning";
  inputs."mongopool-v1_0_0".dir = "nimpkgs/m/mongopool/v1_0_0";
  inputs."mongopool-v1_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mongopool-v1_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."mongopool-v1_0_1".type = "github";
  inputs."mongopool-v1_0_1".owner = "riinr";
  inputs."mongopool-v1_0_1".repo = "flake-nimble";
  inputs."mongopool-v1_0_1".ref = "flake-pinning";
  inputs."mongopool-v1_0_1".dir = "nimpkgs/m/mongopool/v1_0_1";
  inputs."mongopool-v1_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mongopool-v1_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}