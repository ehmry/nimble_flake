{
  description = ''UI building with Gnome's Glade'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."uibuilder-master".type = "github";
  inputs."uibuilder-master".owner = "riinr";
  inputs."uibuilder-master".repo = "flake-nimble";
  inputs."uibuilder-master".ref = "flake-pinning";
  inputs."uibuilder-master".dir = "nimpkgs/u/uibuilder/master";

    inputs."uibuilder-0_1_0".type = "github";
  inputs."uibuilder-0_1_0".owner = "riinr";
  inputs."uibuilder-0_1_0".repo = "flake-nimble";
  inputs."uibuilder-0_1_0".ref = "flake-pinning";
  inputs."uibuilder-0_1_0".dir = "nimpkgs/u/uibuilder/0_1_0";

    inputs."uibuilder-0_1_1".type = "github";
  inputs."uibuilder-0_1_1".owner = "riinr";
  inputs."uibuilder-0_1_1".repo = "flake-nimble";
  inputs."uibuilder-0_1_1".ref = "flake-pinning";
  inputs."uibuilder-0_1_1".dir = "nimpkgs/u/uibuilder/0_1_1";

    inputs."uibuilder-0_2_0".type = "github";
  inputs."uibuilder-0_2_0".owner = "riinr";
  inputs."uibuilder-0_2_0".repo = "flake-nimble";
  inputs."uibuilder-0_2_0".ref = "flake-pinning";
  inputs."uibuilder-0_2_0".dir = "nimpkgs/u/uibuilder/0_2_0";

    inputs."uibuilder-0_2_1".type = "github";
  inputs."uibuilder-0_2_1".owner = "riinr";
  inputs."uibuilder-0_2_1".repo = "flake-nimble";
  inputs."uibuilder-0_2_1".ref = "flake-pinning";
  inputs."uibuilder-0_2_1".dir = "nimpkgs/u/uibuilder/0_2_1";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}