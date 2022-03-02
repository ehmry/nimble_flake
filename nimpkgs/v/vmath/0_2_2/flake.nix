{
  description = ''Collection of math routines for 2d and 3d graphics.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-vmath-0_2_2.flake = false;
  inputs.src-vmath-0_2_2.type = "github";
  inputs.src-vmath-0_2_2.owner = "treeform";
  inputs.src-vmath-0_2_2.repo = "vmath";
  inputs.src-vmath-0_2_2.ref = "refs/tags/0.2.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-vmath-0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-vmath-0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-vmath-0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}