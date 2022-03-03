{
  description = ''A 2D|3D game engine'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."frag-master".type = "github";
  inputs."frag-master".owner = "riinr";
  inputs."frag-master".repo = "flake-nimble";
  inputs."frag-master".ref = "flake-pinning";
  inputs."frag-master".dir = "nimpkgs/f/frag/master";
  inputs."frag-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."frag-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}