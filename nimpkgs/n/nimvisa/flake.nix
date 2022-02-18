{
  description = ''nimvisa is C wrapper for NI-VISA instrument control library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."nimvisa-main".type = "github";
  inputs."nimvisa-main".owner = "riinr";
  inputs."nimvisa-main".repo = "flake-nimble";
  inputs."nimvisa-main".ref = "flake-pinning";
  inputs."nimvisa-main".dir = "nimpkgs/n/nimvisa/main";

    inputs."nimvisa-0_1_0".type = "github";
  inputs."nimvisa-0_1_0".owner = "riinr";
  inputs."nimvisa-0_1_0".repo = "flake-nimble";
  inputs."nimvisa-0_1_0".ref = "flake-pinning";
  inputs."nimvisa-0_1_0".dir = "nimpkgs/n/nimvisa/0_1_0";

    inputs."nimvisa-0_1_1".type = "github";
  inputs."nimvisa-0_1_1".owner = "riinr";
  inputs."nimvisa-0_1_1".repo = "flake-nimble";
  inputs."nimvisa-0_1_1".ref = "flake-pinning";
  inputs."nimvisa-0_1_1".dir = "nimpkgs/n/nimvisa/0_1_1";

    inputs."nimvisa-0_1_2".type = "github";
  inputs."nimvisa-0_1_2".owner = "riinr";
  inputs."nimvisa-0_1_2".repo = "flake-nimble";
  inputs."nimvisa-0_1_2".ref = "flake-pinning";
  inputs."nimvisa-0_1_2".dir = "nimpkgs/n/nimvisa/0_1_2";

    inputs."nimvisa-0_1_3".type = "github";
  inputs."nimvisa-0_1_3".owner = "riinr";
  inputs."nimvisa-0_1_3".repo = "flake-nimble";
  inputs."nimvisa-0_1_3".ref = "flake-pinning";
  inputs."nimvisa-0_1_3".dir = "nimpkgs/n/nimvisa/0_1_3";

    inputs."nimvisa-0_1_4".type = "github";
  inputs."nimvisa-0_1_4".owner = "riinr";
  inputs."nimvisa-0_1_4".repo = "flake-nimble";
  inputs."nimvisa-0_1_4".ref = "flake-pinning";
  inputs."nimvisa-0_1_4".dir = "nimpkgs/n/nimvisa/0_1_4";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}