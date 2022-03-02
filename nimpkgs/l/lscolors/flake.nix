{
  description = ''A library for colorizing paths according to LS_COLORS'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."lscolors-master".type = "github";
  inputs."lscolors-master".owner = "riinr";
  inputs."lscolors-master".repo = "flake-nimble";
  inputs."lscolors-master".ref = "flake-pinning";
  inputs."lscolors-master".dir = "nimpkgs/l/lscolors/master";

    inputs."lscolors-v0_1_0".type = "github";
  inputs."lscolors-v0_1_0".owner = "riinr";
  inputs."lscolors-v0_1_0".repo = "flake-nimble";
  inputs."lscolors-v0_1_0".ref = "flake-pinning";
  inputs."lscolors-v0_1_0".dir = "nimpkgs/l/lscolors/v0_1_0";

    inputs."lscolors-v0_2_0".type = "github";
  inputs."lscolors-v0_2_0".owner = "riinr";
  inputs."lscolors-v0_2_0".repo = "flake-nimble";
  inputs."lscolors-v0_2_0".ref = "flake-pinning";
  inputs."lscolors-v0_2_0".dir = "nimpkgs/l/lscolors/v0_2_0";

    inputs."lscolors-v0_2_1".type = "github";
  inputs."lscolors-v0_2_1".owner = "riinr";
  inputs."lscolors-v0_2_1".repo = "flake-nimble";
  inputs."lscolors-v0_2_1".ref = "flake-pinning";
  inputs."lscolors-v0_2_1".dir = "nimpkgs/l/lscolors/v0_2_1";

    inputs."lscolors-v0_2_2".type = "github";
  inputs."lscolors-v0_2_2".owner = "riinr";
  inputs."lscolors-v0_2_2".repo = "flake-nimble";
  inputs."lscolors-v0_2_2".ref = "flake-pinning";
  inputs."lscolors-v0_2_2".dir = "nimpkgs/l/lscolors/v0_2_2";

    inputs."lscolors-v0_3_0".type = "github";
  inputs."lscolors-v0_3_0".owner = "riinr";
  inputs."lscolors-v0_3_0".repo = "flake-nimble";
  inputs."lscolors-v0_3_0".ref = "flake-pinning";
  inputs."lscolors-v0_3_0".dir = "nimpkgs/l/lscolors/v0_3_0";

    inputs."lscolors-v0_3_1".type = "github";
  inputs."lscolors-v0_3_1".owner = "riinr";
  inputs."lscolors-v0_3_1".repo = "flake-nimble";
  inputs."lscolors-v0_3_1".ref = "flake-pinning";
  inputs."lscolors-v0_3_1".dir = "nimpkgs/l/lscolors/v0_3_1";

    inputs."lscolors-v0_3_2".type = "github";
  inputs."lscolors-v0_3_2".owner = "riinr";
  inputs."lscolors-v0_3_2".repo = "flake-nimble";
  inputs."lscolors-v0_3_2".ref = "flake-pinning";
  inputs."lscolors-v0_3_2".dir = "nimpkgs/l/lscolors/v0_3_2";

    inputs."lscolors-v0_3_3".type = "github";
  inputs."lscolors-v0_3_3".owner = "riinr";
  inputs."lscolors-v0_3_3".repo = "flake-nimble";
  inputs."lscolors-v0_3_3".ref = "flake-pinning";
  inputs."lscolors-v0_3_3".dir = "nimpkgs/l/lscolors/v0_3_3";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}