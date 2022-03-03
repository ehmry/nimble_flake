{
  description = ''Library for parsing, stringifying, reading, and writing CSV (comma separated value) files'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."csv-master".type = "github";
  inputs."csv-master".owner = "riinr";
  inputs."csv-master".repo = "flake-nimble";
  inputs."csv-master".ref = "flake-pinning";
  inputs."csv-master".dir = "nimpkgs/c/csv/master";
  inputs."csv-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."csv-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}