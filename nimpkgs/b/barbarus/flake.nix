{
  description = ''A simple extensible i18n engine.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."barbarus-master".type = "github";
  inputs."barbarus-master".owner = "riinr";
  inputs."barbarus-master".repo = "flake-nimble";
  inputs."barbarus-master".ref = "flake-pinning";
  inputs."barbarus-master".dir = "nimpkgs/b/barbarus/master";
  inputs."barbarus-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."barbarus-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}