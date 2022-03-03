{
  description = ''A Nim-based, non-graphical application designed to measure the amount of time elapsed from its activation to deactivation, includes total elapsed time, lap, and split times.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimstopwatch-master.flake = false;
  inputs.src-nimstopwatch-master.type = "github";
  inputs.src-nimstopwatch-master.owner = "twist-vector";
  inputs.src-nimstopwatch-master.repo = "nim-stopwatch";
  inputs.src-nimstopwatch-master.ref = "refs/heads/master";
  inputs.src-nimstopwatch-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimstopwatch-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimstopwatch-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimstopwatch-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}