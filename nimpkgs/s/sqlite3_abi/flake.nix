{
  description = ''A wrapper for SQLite'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."sqlite3_abi-master".type = "github";
  inputs."sqlite3_abi-master".owner = "riinr";
  inputs."sqlite3_abi-master".repo = "flake-nimble";
  inputs."sqlite3_abi-master".ref = "flake-pinning";
  inputs."sqlite3_abi-master".dir = "nimpkgs/s/sqlite3_abi/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}