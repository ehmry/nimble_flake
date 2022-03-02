{
  description = ''A loose, direct to object json parser with hooks.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."jsony-master".type = "github";
  inputs."jsony-master".owner = "riinr";
  inputs."jsony-master".repo = "flake-nimble";
  inputs."jsony-master".ref = "flake-pinning";
  inputs."jsony-master".dir = "nimpkgs/j/jsony/master";

    inputs."jsony-0_0_1".type = "github";
  inputs."jsony-0_0_1".owner = "riinr";
  inputs."jsony-0_0_1".repo = "flake-nimble";
  inputs."jsony-0_0_1".ref = "flake-pinning";
  inputs."jsony-0_0_1".dir = "nimpkgs/j/jsony/0_0_1";

    inputs."jsony-0_0_2".type = "github";
  inputs."jsony-0_0_2".owner = "riinr";
  inputs."jsony-0_0_2".repo = "flake-nimble";
  inputs."jsony-0_0_2".ref = "flake-pinning";
  inputs."jsony-0_0_2".dir = "nimpkgs/j/jsony/0_0_2";

    inputs."jsony-0_0_4".type = "github";
  inputs."jsony-0_0_4".owner = "riinr";
  inputs."jsony-0_0_4".repo = "flake-nimble";
  inputs."jsony-0_0_4".ref = "flake-pinning";
  inputs."jsony-0_0_4".dir = "nimpkgs/j/jsony/0_0_4";

    inputs."jsony-0_0_5".type = "github";
  inputs."jsony-0_0_5".owner = "riinr";
  inputs."jsony-0_0_5".repo = "flake-nimble";
  inputs."jsony-0_0_5".ref = "flake-pinning";
  inputs."jsony-0_0_5".dir = "nimpkgs/j/jsony/0_0_5";

    inputs."jsony-1_0_0".type = "github";
  inputs."jsony-1_0_0".owner = "riinr";
  inputs."jsony-1_0_0".repo = "flake-nimble";
  inputs."jsony-1_0_0".ref = "flake-pinning";
  inputs."jsony-1_0_0".dir = "nimpkgs/j/jsony/1_0_0";

    inputs."jsony-1_0_1".type = "github";
  inputs."jsony-1_0_1".owner = "riinr";
  inputs."jsony-1_0_1".repo = "flake-nimble";
  inputs."jsony-1_0_1".ref = "flake-pinning";
  inputs."jsony-1_0_1".dir = "nimpkgs/j/jsony/1_0_1";

    inputs."jsony-1_0_3".type = "github";
  inputs."jsony-1_0_3".owner = "riinr";
  inputs."jsony-1_0_3".repo = "flake-nimble";
  inputs."jsony-1_0_3".ref = "flake-pinning";
  inputs."jsony-1_0_3".dir = "nimpkgs/j/jsony/1_0_3";

    inputs."jsony-1_0_4".type = "github";
  inputs."jsony-1_0_4".owner = "riinr";
  inputs."jsony-1_0_4".repo = "flake-nimble";
  inputs."jsony-1_0_4".ref = "flake-pinning";
  inputs."jsony-1_0_4".dir = "nimpkgs/j/jsony/1_0_4";

    inputs."jsony-1_0_5".type = "github";
  inputs."jsony-1_0_5".owner = "riinr";
  inputs."jsony-1_0_5".repo = "flake-nimble";
  inputs."jsony-1_0_5".ref = "flake-pinning";
  inputs."jsony-1_0_5".dir = "nimpkgs/j/jsony/1_0_5";

    inputs."jsony-1_1_0".type = "github";
  inputs."jsony-1_1_0".owner = "riinr";
  inputs."jsony-1_1_0".repo = "flake-nimble";
  inputs."jsony-1_1_0".ref = "flake-pinning";
  inputs."jsony-1_1_0".dir = "nimpkgs/j/jsony/1_1_0";

    inputs."jsony-1_1_1".type = "github";
  inputs."jsony-1_1_1".owner = "riinr";
  inputs."jsony-1_1_1".repo = "flake-nimble";
  inputs."jsony-1_1_1".ref = "flake-pinning";
  inputs."jsony-1_1_1".dir = "nimpkgs/j/jsony/1_1_1";

    inputs."jsony-1_1_2".type = "github";
  inputs."jsony-1_1_2".owner = "riinr";
  inputs."jsony-1_1_2".repo = "flake-nimble";
  inputs."jsony-1_1_2".ref = "flake-pinning";
  inputs."jsony-1_1_2".dir = "nimpkgs/j/jsony/1_1_2";

    inputs."jsony-1_1_3".type = "github";
  inputs."jsony-1_1_3".owner = "riinr";
  inputs."jsony-1_1_3".repo = "flake-nimble";
  inputs."jsony-1_1_3".ref = "flake-pinning";
  inputs."jsony-1_1_3".dir = "nimpkgs/j/jsony/1_1_3";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}