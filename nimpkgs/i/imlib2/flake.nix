{
  description = ''Simple wrapper of the Imlib2 library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."imlib2-master".type = "github";
  inputs."imlib2-master".owner = "riinr";
  inputs."imlib2-master".repo = "flake-nimble";
  inputs."imlib2-master".ref = "flake-pinning";
  inputs."imlib2-master".dir = "nimpkgs/i/imlib2/master";
  inputs."imlib2-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."imlib2-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}