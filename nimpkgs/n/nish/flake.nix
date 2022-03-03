{
  description = ''A Toy Shell Application'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."nish-master".type = "github";
  inputs."nish-master".owner = "riinr";
  inputs."nish-master".repo = "flake-nimble";
  inputs."nish-master".ref = "flake-pinning";
  inputs."nish-master".dir = "nimpkgs/n/nish/master";
  inputs."nish-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nish-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}