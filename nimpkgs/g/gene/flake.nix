{
  description = ''Gene - a general purpose language'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."gene-master".type = "github";
  inputs."gene-master".owner = "riinr";
  inputs."gene-master".repo = "flake-nimble";
  inputs."gene-master".ref = "flake-pinning";
  inputs."gene-master".dir = "nimpkgs/g/gene/master";
  inputs."gene-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gene-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}