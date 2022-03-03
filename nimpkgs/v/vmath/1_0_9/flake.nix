{
  description = ''Collection of math routines for 2d and 3d graphics.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-vmath-1_0_9.flake = false;
  inputs.src-vmath-1_0_9.type = "github";
  inputs.src-vmath-1_0_9.owner = "treeform";
  inputs.src-vmath-1_0_9.repo = "vmath";
  inputs.src-vmath-1_0_9.ref = "refs/tags/1.0.9";
  inputs.src-vmath-1_0_9.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-vmath-1_0_9, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-vmath-1_0_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-vmath-1_0_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}