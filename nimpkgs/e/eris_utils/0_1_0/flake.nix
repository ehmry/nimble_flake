{
  description = ''Utilities for the Encoding for Robust Immutable Storage (ERIS)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-eris_utils-0_1_0.flake = false;
  inputs.src-eris_utils-0_1_0.type = "other";
  inputs.src-eris_utils-0_1_0.owner = "~ehmry";
  inputs.src-eris_utils-0_1_0.repo = "eris_utils";
  inputs.src-eris_utils-0_1_0.ref = "refs/tags/0.1.0";
  inputs.src-eris_utils-0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."eris".type = "github";
  # inputs."eris".owner = "riinr";
  # inputs."eris".repo = "flake-nimble";
  # inputs."eris".ref = "flake-pinning";
  # inputs."eris".dir = "nimpkgs/e/eris";
  # inputs."eris".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."eris".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-eris_utils-0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-eris_utils-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-eris_utils-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}