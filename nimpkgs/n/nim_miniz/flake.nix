{
  description = ''Nim wrapper for miniz'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."nim_miniz-master".type = "github";
  inputs."nim_miniz-master".owner = "riinr";
  inputs."nim_miniz-master".repo = "flake-nimble";
  inputs."nim_miniz-master".ref = "flake-pinning";
  inputs."nim_miniz-master".dir = "nimpkgs/n/nim_miniz/master";

    inputs."nim_miniz-1_0_1".type = "github";
  inputs."nim_miniz-1_0_1".owner = "riinr";
  inputs."nim_miniz-1_0_1".repo = "flake-nimble";
  inputs."nim_miniz-1_0_1".ref = "flake-pinning";
  inputs."nim_miniz-1_0_1".dir = "nimpkgs/n/nim_miniz/1_0_1";

    inputs."nim_miniz-1_1_0".type = "github";
  inputs."nim_miniz-1_1_0".owner = "riinr";
  inputs."nim_miniz-1_1_0".repo = "flake-nimble";
  inputs."nim_miniz-1_1_0".ref = "flake-pinning";
  inputs."nim_miniz-1_1_0".dir = "nimpkgs/n/nim_miniz/1_1_0";

    inputs."nim_miniz-v1_0_0".type = "github";
  inputs."nim_miniz-v1_0_0".owner = "riinr";
  inputs."nim_miniz-v1_0_0".repo = "flake-nimble";
  inputs."nim_miniz-v1_0_0".ref = "flake-pinning";
  inputs."nim_miniz-v1_0_0".dir = "nimpkgs/n/nim_miniz/v1_0_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}