{
  description = ''Distances is a high performance Nim library for calculating distances.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-distances-v0_1_0.flake = false;
  inputs.src-distances-v0_1_0.type = "github";
  inputs.src-distances-v0_1_0.owner = "ayman-albaz";
  inputs.src-distances-v0_1_0.repo = "distances";
  inputs.src-distances-v0_1_0.ref = "refs/tags/v0.1.0";
  
  
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";

  
  inputs."neo".type = "github";
  inputs."neo".owner = "riinr";
  inputs."neo".repo = "flake-nimble";
  inputs."neo".ref = "flake-pinning";
  inputs."neo".dir = "nimpkgs/n/neo";

  outputs = { self, nixpkgs, flakeNimbleLib, src-distances-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-distances-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-distances-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}