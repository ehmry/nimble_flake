{
  description = ''A high level SQLite API for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-sqliteral-1_0_0.flake = false;
  inputs.src-sqliteral-1_0_0.type = "github";
  inputs.src-sqliteral-1_0_0.owner = "olliNiinivaara";
  inputs.src-sqliteral-1_0_0.repo = "SQLiteral";
  inputs.src-sqliteral-1_0_0.ref = "refs/tags/1.0.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-sqliteral-1_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sqliteral-1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sqliteral-1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}