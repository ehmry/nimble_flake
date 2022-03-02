{
  description = ''The Hundred Rabbits theme ecosystem brought to Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."rabbit-main".type = "github";
  inputs."rabbit-main".owner = "riinr";
  inputs."rabbit-main".repo = "flake-nimble";
  inputs."rabbit-main".ref = "flake-pinning";
  inputs."rabbit-main".dir = "nimpkgs/r/rabbit/main";

    inputs."rabbit-v0_1_0".type = "github";
  inputs."rabbit-v0_1_0".owner = "riinr";
  inputs."rabbit-v0_1_0".repo = "flake-nimble";
  inputs."rabbit-v0_1_0".ref = "flake-pinning";
  inputs."rabbit-v0_1_0".dir = "nimpkgs/r/rabbit/v0_1_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}