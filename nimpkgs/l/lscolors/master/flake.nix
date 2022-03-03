{
  description = ''A library for colorizing paths according to LS_COLORS'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-lscolors-master.flake = false;
  inputs.src-lscolors-master.type = "github";
  inputs.src-lscolors-master.owner = "joachimschmidt557";
  inputs.src-lscolors-master.repo = "nim-lscolors";
  inputs.src-lscolors-master.ref = "refs/heads/master";
  inputs.src-lscolors-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-lscolors-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lscolors-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-lscolors-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}