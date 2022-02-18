{
  description = ''A tiny static file web server.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."srv-master".type = "github";
  inputs."srv-master".owner = "riinr";
  inputs."srv-master".repo = "flake-nimble";
  inputs."srv-master".ref = "flake-pinning";
  inputs."srv-master".dir = "nimpkgs/s/srv/master";

    inputs."srv-v0_1_0".type = "github";
  inputs."srv-v0_1_0".owner = "riinr";
  inputs."srv-v0_1_0".repo = "flake-nimble";
  inputs."srv-v0_1_0".ref = "flake-pinning";
  inputs."srv-v0_1_0".dir = "nimpkgs/s/srv/v0_1_0";

    inputs."srv-v0_2_0".type = "github";
  inputs."srv-v0_2_0".owner = "riinr";
  inputs."srv-v0_2_0".repo = "flake-nimble";
  inputs."srv-v0_2_0".ref = "flake-pinning";
  inputs."srv-v0_2_0".dir = "nimpkgs/s/srv/v0_2_0";

    inputs."srv-v0_3_0".type = "github";
  inputs."srv-v0_3_0".owner = "riinr";
  inputs."srv-v0_3_0".repo = "flake-nimble";
  inputs."srv-v0_3_0".ref = "flake-pinning";
  inputs."srv-v0_3_0".dir = "nimpkgs/s/srv/v0_3_0";

    inputs."srv-v0_3_1".type = "github";
  inputs."srv-v0_3_1".owner = "riinr";
  inputs."srv-v0_3_1".repo = "flake-nimble";
  inputs."srv-v0_3_1".ref = "flake-pinning";
  inputs."srv-v0_3_1".dir = "nimpkgs/s/srv/v0_3_1";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}