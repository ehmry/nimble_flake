{
  description = ''A random variable generating library for nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-randgen-master.flake = false;
  inputs.src-randgen-master.type = "github";
  inputs.src-randgen-master.owner = "YesDrX";
  inputs.src-randgen-master.repo = "randgen";
  inputs.src-randgen-master.ref = "refs/heads/master";
  inputs.src-randgen-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-randgen-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-randgen-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-randgen-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}