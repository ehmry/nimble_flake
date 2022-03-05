{
  description = ''The Nim GUI/2D framework based on OpenGL and SDL2.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nodesnim-nightly-0_3_0a.flake = false;
  inputs.src-nodesnim-nightly-0_3_0a.type = "github";
  inputs.src-nodesnim-nightly-0_3_0a.owner = "Ethosa";
  inputs.src-nodesnim-nightly-0_3_0a.repo = "nodesnim";
  inputs.src-nodesnim-nightly-0_3_0a.ref = "refs/tags/nightly-0.3.0a";
  inputs.src-nodesnim-nightly-0_3_0a.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nodesnim-nightly-0_3_0a, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nodesnim-nightly-0_3_0a;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nodesnim-nightly-0_3_0a"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}