{
  description = ''Nim implementation of the standard unix drand48 pseudo random number generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-drand48-v1_1_2.flake = false;
  inputs.src-drand48-v1_1_2.type = "github";
  inputs.src-drand48-v1_1_2.owner = "JeffersonLab";
  inputs.src-drand48-v1_1_2.repo = "drand48";
  inputs.src-drand48-v1_1_2.ref = "refs/tags/v1.1.2";
  inputs.src-drand48-v1_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-drand48-v1_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-drand48-v1_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-drand48-v1_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}