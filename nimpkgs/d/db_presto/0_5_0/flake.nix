{
  description = ''prestodb simple connector'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-db_presto-0_5_0.flake = false;
  inputs.src-db_presto-0_5_0.type = "github";
  inputs.src-db_presto-0_5_0.owner = "Bennyelg";
  inputs.src-db_presto-0_5_0.repo = "nimPresto";
  inputs.src-db_presto-0_5_0.ref = "refs/tags/0.5.0";
  inputs.src-db_presto-0_5_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-db_presto-0_5_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-db_presto-0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-db_presto-0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}