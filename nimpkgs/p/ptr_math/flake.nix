{
  description = ''Pointer arithmetic library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."ptr_math-main".type = "github";
  inputs."ptr_math-main".owner = "riinr";
  inputs."ptr_math-main".repo = "flake-nimble";
  inputs."ptr_math-main".ref = "flake-pinning";
  inputs."ptr_math-main".dir = "nimpkgs/p/ptr_math/main";

    inputs."ptr_math-v0_0_1".type = "github";
  inputs."ptr_math-v0_0_1".owner = "riinr";
  inputs."ptr_math-v0_0_1".repo = "flake-nimble";
  inputs."ptr_math-v0_0_1".ref = "flake-pinning";
  inputs."ptr_math-v0_0_1".dir = "nimpkgs/p/ptr_math/v0_0_1";

    inputs."ptr_math-v0_2_0".type = "github";
  inputs."ptr_math-v0_2_0".owner = "riinr";
  inputs."ptr_math-v0_2_0".repo = "flake-nimble";
  inputs."ptr_math-v0_2_0".ref = "flake-pinning";
  inputs."ptr_math-v0_2_0".dir = "nimpkgs/p/ptr_math/v0_2_0";

    inputs."ptr_math-v0_3_0".type = "github";
  inputs."ptr_math-v0_3_0".owner = "riinr";
  inputs."ptr_math-v0_3_0".repo = "flake-nimble";
  inputs."ptr_math-v0_3_0".ref = "flake-pinning";
  inputs."ptr_math-v0_3_0".dir = "nimpkgs/p/ptr_math/v0_3_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}