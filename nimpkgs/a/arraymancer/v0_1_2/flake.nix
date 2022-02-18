{
  description = ''A tensor (multidimensional array) library for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-arraymancer-v0_1_2.flake = false;
  inputs.src-arraymancer-v0_1_2.type = "github";
  inputs.src-arraymancer-v0_1_2.owner = "mratsim";
  inputs.src-arraymancer-v0_1_2.repo = "Arraymancer";
  inputs.src-arraymancer-v0_1_2.ref = "refs/tags/v0.1.2";
  
  
  inputs."nimblas".type = "github";
  inputs."nimblas".owner = "riinr";
  inputs."nimblas".repo = "flake-nimble";
  inputs."nimblas".ref = "flake-pinning";
  inputs."nimblas".dir = "nimpkgs/n/nimblas";

  outputs = { self, nixpkgs, flakeNimbleLib, src-arraymancer-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arraymancer-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-arraymancer-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}