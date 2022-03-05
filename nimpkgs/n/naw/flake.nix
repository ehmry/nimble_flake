{
  description = ''A glue wrapper to do awk-style text processing with Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."naw-master".type = "github";
  inputs."naw-master".owner = "riinr";
  inputs."naw-master".repo = "flake-nimble";
  inputs."naw-master".ref = "flake-pinning";
  inputs."naw-master".dir = "nimpkgs/n/naw/master";
  inputs."naw-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."naw-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}