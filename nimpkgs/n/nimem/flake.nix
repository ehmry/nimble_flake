{
  description = ''Library for external memory manipulation on a windows process'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."nimem-master".type = "github";
  inputs."nimem-master".owner = "riinr";
  inputs."nimem-master".repo = "flake-nimble";
  inputs."nimem-master".ref = "flake-pinning";
  inputs."nimem-master".dir = "nimpkgs/n/nimem/master";
  inputs."nimem-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimem-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}