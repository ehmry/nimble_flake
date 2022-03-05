{
  description = ''Redis-backed sessions for jester'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."redissessions-master".type = "github";
  inputs."redissessions-master".owner = "riinr";
  inputs."redissessions-master".repo = "flake-nimble";
  inputs."redissessions-master".ref = "flake-pinning";
  inputs."redissessions-master".dir = "nimpkgs/r/redissessions/master";
  inputs."redissessions-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."redissessions-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}