{
  description = ''Collection of math routines for 2d and 3d graphics.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-vmath-1_1_1.flake = false;
  inputs.src-vmath-1_1_1.type = "github";
  inputs.src-vmath-1_1_1.owner = "treeform";
  inputs.src-vmath-1_1_1.repo = "vmath";
  inputs.src-vmath-1_1_1.ref = "refs/tags/1.1.1";
  inputs.src-vmath-1_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-vmath-1_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-vmath-1_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-vmath-1_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}