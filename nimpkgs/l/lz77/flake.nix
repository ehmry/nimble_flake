{
  description = ''Implementation of various LZ77 algorithms'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."lz77-master".type = "github";
  inputs."lz77-master".owner = "riinr";
  inputs."lz77-master".repo = "flake-nimble";
  inputs."lz77-master".ref = "flake-pinning";
  inputs."lz77-master".dir = "nimpkgs/l/lz77/master";
  inputs."lz77-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."lz77-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}