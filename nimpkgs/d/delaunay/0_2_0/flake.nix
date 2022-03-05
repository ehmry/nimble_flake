{
  description = ''2D Delaunay triangulations'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-delaunay-0_2_0.flake = false;
  inputs.src-delaunay-0_2_0.type = "github";
  inputs.src-delaunay-0_2_0.owner = "Nycto";
  inputs.src-delaunay-0_2_0.repo = "DelaunayNim";
  inputs.src-delaunay-0_2_0.ref = "refs/tags/0.2.0";
  inputs.src-delaunay-0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-delaunay-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-delaunay-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-delaunay-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}