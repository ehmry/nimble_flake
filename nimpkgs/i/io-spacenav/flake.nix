{
  description = ''Obsolete - please use spacenav instead!'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."io-spacenav-master".type = "github";
  inputs."io-spacenav-master".owner = "riinr";
  inputs."io-spacenav-master".repo = "flake-nimble";
  inputs."io-spacenav-master".ref = "flake-pinning";
  inputs."io-spacenav-master".dir = "nimpkgs/i/io-spacenav/master";
  inputs."io-spacenav-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."io-spacenav-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}