{
  description = ''Wrapper for the DevIL image library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."devil-master".type = "github";
  inputs."devil-master".owner = "riinr";
  inputs."devil-master".repo = "flake-nimble";
  inputs."devil-master".ref = "flake-pinning";
  inputs."devil-master".dir = "nimpkgs/d/devil/master";
  inputs."devil-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."devil-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}