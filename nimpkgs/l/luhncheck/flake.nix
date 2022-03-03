{
  description = ''Implementation of Luhn algorithm in nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."luhncheck-master".type = "github";
  inputs."luhncheck-master".owner = "riinr";
  inputs."luhncheck-master".repo = "flake-nimble";
  inputs."luhncheck-master".ref = "flake-pinning";
  inputs."luhncheck-master".dir = "nimpkgs/l/luhncheck/master";
  inputs."luhncheck-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."luhncheck-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}