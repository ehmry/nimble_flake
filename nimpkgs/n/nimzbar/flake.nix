{
  description = ''zbar wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."nimzbar-master".type = "github";
  inputs."nimzbar-master".owner = "riinr";
  inputs."nimzbar-master".repo = "flake-nimble";
  inputs."nimzbar-master".ref = "flake-pinning";
  inputs."nimzbar-master".dir = "nimpkgs/n/nimzbar/master";

    inputs."nimzbar-v0_1_0".type = "github";
  inputs."nimzbar-v0_1_0".owner = "riinr";
  inputs."nimzbar-v0_1_0".repo = "flake-nimble";
  inputs."nimzbar-v0_1_0".ref = "flake-pinning";
  inputs."nimzbar-v0_1_0".dir = "nimpkgs/n/nimzbar/v0_1_0";

    inputs."nimzbar-v0_1_1".type = "github";
  inputs."nimzbar-v0_1_1".owner = "riinr";
  inputs."nimzbar-v0_1_1".repo = "flake-nimble";
  inputs."nimzbar-v0_1_1".ref = "flake-pinning";
  inputs."nimzbar-v0_1_1".dir = "nimpkgs/n/nimzbar/v0_1_1";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}