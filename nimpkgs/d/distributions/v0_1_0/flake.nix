{
  description = ''Distributions is a Nim library for distributions and their functions.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-distributions-v0_1_0.flake = false;
  inputs.src-distributions-v0_1_0.type = "github";
  inputs.src-distributions-v0_1_0.owner = "ayman-albaz";
  inputs.src-distributions-v0_1_0.repo = "distributions";
  inputs.src-distributions-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-distributions-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."special_functions".type = "github";
  inputs."special_functions".owner = "riinr";
  inputs."special_functions".repo = "flake-nimble";
  inputs."special_functions".ref = "flake-pinning";
  inputs."special_functions".dir = "nimpkgs/s/special_functions";
  inputs."special_functions".inputs.nixpkgs.follows = "nixpkgs";
  inputs."special_functions".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-distributions-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-distributions-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-distributions-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}