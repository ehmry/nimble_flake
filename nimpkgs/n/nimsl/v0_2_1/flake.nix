{
  description = ''Shaders in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimsl-v0_2_1.flake = false;
  inputs.src-nimsl-v0_2_1.type = "github";
  inputs.src-nimsl-v0_2_1.owner = "yglukhov";
  inputs.src-nimsl-v0_2_1.repo = "nimsl";
  inputs.src-nimsl-v0_2_1.ref = "refs/tags/v0.2.1";
  inputs.src-nimsl-v0_2_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."variant".type = "github";
  # inputs."variant".owner = "riinr";
  # inputs."variant".repo = "flake-nimble";
  # inputs."variant".ref = "flake-pinning";
  # inputs."variant".dir = "nimpkgs/v/variant";
  # inputs."variant".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."variant".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimsl-v0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimsl-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimsl-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}