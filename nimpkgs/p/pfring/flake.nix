{
  description = ''PF_RING wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."pfring-master".type = "github";
  inputs."pfring-master".owner = "riinr";
  inputs."pfring-master".repo = "flake-nimble";
  inputs."pfring-master".ref = "flake-pinning";
  inputs."pfring-master".dir = "nimpkgs/p/pfring/master";

    inputs."pfring-0_0_2".type = "github";
  inputs."pfring-0_0_2".owner = "riinr";
  inputs."pfring-0_0_2".repo = "flake-nimble";
  inputs."pfring-0_0_2".ref = "flake-pinning";
  inputs."pfring-0_0_2".dir = "nimpkgs/p/pfring/0_0_2";

    inputs."pfring-0_0_3".type = "github";
  inputs."pfring-0_0_3".owner = "riinr";
  inputs."pfring-0_0_3".repo = "flake-nimble";
  inputs."pfring-0_0_3".ref = "flake-pinning";
  inputs."pfring-0_0_3".dir = "nimpkgs/p/pfring/0_0_3";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}