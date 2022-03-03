{
  description = ''Asynchronous MySQL connector written in pure Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."asyncmysql-master".type = "github";
  inputs."asyncmysql-master".owner = "riinr";
  inputs."asyncmysql-master".repo = "flake-nimble";
  inputs."asyncmysql-master".ref = "flake-pinning";
  inputs."asyncmysql-master".dir = "nimpkgs/a/asyncmysql/master";
  inputs."asyncmysql-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."asyncmysql-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."asyncmysql-0_4_3".type = "github";
  inputs."asyncmysql-0_4_3".owner = "riinr";
  inputs."asyncmysql-0_4_3".repo = "flake-nimble";
  inputs."asyncmysql-0_4_3".ref = "flake-pinning";
  inputs."asyncmysql-0_4_3".dir = "nimpkgs/a/asyncmysql/0_4_3";
  inputs."asyncmysql-0_4_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."asyncmysql-0_4_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}