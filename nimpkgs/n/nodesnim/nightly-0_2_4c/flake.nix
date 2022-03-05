{
  description = ''The Nim GUI/2D framework based on OpenGL and SDL2.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nodesnim-nightly-0_2_4c.flake = false;
  inputs.src-nodesnim-nightly-0_2_4c.type = "github";
  inputs.src-nodesnim-nightly-0_2_4c.owner = "Ethosa";
  inputs.src-nodesnim-nightly-0_2_4c.repo = "nodesnim";
  inputs.src-nodesnim-nightly-0_2_4c.ref = "refs/tags/nightly-0.2.4c";
  inputs.src-nodesnim-nightly-0_2_4c.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nodesnim-nightly-0_2_4c, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nodesnim-nightly-0_2_4c;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nodesnim-nightly-0_2_4c"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}