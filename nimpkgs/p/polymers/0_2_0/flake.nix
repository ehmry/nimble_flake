{
  description = ''A library of components and systems for use with the Polymorph ECS'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-polymers-0_2_0.flake = false;
  inputs.src-polymers-0_2_0.type = "github";
  inputs.src-polymers-0_2_0.owner = "rlipsc";
  inputs.src-polymers-0_2_0.repo = "polymers";
  inputs.src-polymers-0_2_0.ref = "refs/tags/0.2.0";
  
  
  inputs."polymorph".type = "github";
  inputs."polymorph".owner = "riinr";
  inputs."polymorph".repo = "flake-nimble";
  inputs."polymorph".ref = "flake-pinning";
  inputs."polymorph".dir = "nimpkgs/p/polymorph";

  outputs = { self, nixpkgs, flakeNimbleLib, src-polymers-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-polymers-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-polymers-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}