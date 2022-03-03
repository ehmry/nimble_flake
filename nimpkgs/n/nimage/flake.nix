{
  description = ''The image management library written in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."nimage-master".type = "github";
  inputs."nimage-master".owner = "riinr";
  inputs."nimage-master".repo = "flake-nimble";
  inputs."nimage-master".ref = "flake-pinning";
  inputs."nimage-master".dir = "nimpkgs/n/nimage/master";
  inputs."nimage-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimage-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}