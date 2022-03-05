{
  description = ''Obsolete - please use oculus instead!'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."io-oculus-master".type = "github";
  inputs."io-oculus-master".owner = "riinr";
  inputs."io-oculus-master".repo = "flake-nimble";
  inputs."io-oculus-master".ref = "flake-pinning";
  inputs."io-oculus-master".dir = "nimpkgs/i/io-oculus/master";
  inputs."io-oculus-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."io-oculus-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}