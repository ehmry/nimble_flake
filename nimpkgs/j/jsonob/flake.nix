{
  description = ''JSON / Object mapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."jsonob-master".type = "github";
  inputs."jsonob-master".owner = "riinr";
  inputs."jsonob-master".repo = "flake-nimble";
  inputs."jsonob-master".ref = "flake-pinning";
  inputs."jsonob-master".dir = "nimpkgs/j/jsonob/master";
  inputs."jsonob-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jsonob-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}