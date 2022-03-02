{
  description = ''2D GPU rendering with a tiling atlas.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-boxy-0_3_2.flake = false;
  inputs.src-boxy-0_3_2.type = "github";
  inputs.src-boxy-0_3_2.owner = "treeform";
  inputs.src-boxy-0_3_2.repo = "boxy";
  inputs.src-boxy-0_3_2.ref = "refs/tags/0.3.2";
  inputs.src-boxy-0_3_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."pixie".type = "github";
  # inputs."pixie".owner = "riinr";
  # inputs."pixie".repo = "flake-nimble";
  # inputs."pixie".ref = "flake-pinning";
  # inputs."pixie".dir = "nimpkgs/p/pixie";
  # inputs."pixie".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."pixie".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."vmath".type = "github";
  # inputs."vmath".owner = "riinr";
  # inputs."vmath".repo = "flake-nimble";
  # inputs."vmath".ref = "flake-pinning";
  # inputs."vmath".dir = "nimpkgs/v/vmath";
  # inputs."vmath".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."vmath".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."opengl".type = "github";
  # inputs."opengl".owner = "riinr";
  # inputs."opengl".repo = "flake-nimble";
  # inputs."opengl".ref = "flake-pinning";
  # inputs."opengl".dir = "nimpkgs/o/opengl";
  # inputs."opengl".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."opengl".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."bitty".type = "github";
  # inputs."bitty".owner = "riinr";
  # inputs."bitty".repo = "flake-nimble";
  # inputs."bitty".ref = "flake-pinning";
  # inputs."bitty".dir = "nimpkgs/b/bitty";
  # inputs."bitty".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."bitty".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-boxy-0_3_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-boxy-0_3_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-boxy-0_3_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}