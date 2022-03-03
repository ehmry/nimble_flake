{
  description = ''Grid plugin for wNim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."wzeegrid-master".type = "github";
  inputs."wzeegrid-master".owner = "riinr";
  inputs."wzeegrid-master".repo = "flake-nimble";
  inputs."wzeegrid-master".ref = "flake-pinning";
  inputs."wzeegrid-master".dir = "nimpkgs/w/wzeegrid/master";
  inputs."wzeegrid-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."wzeegrid-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}