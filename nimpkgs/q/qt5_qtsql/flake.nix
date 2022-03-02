{
  description = ''Binding for Qt 5's Qt SQL library that integrates with the features of the Nim language. Uses one API for multiple database engines.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."qt5_qtsql-master".type = "github";
  inputs."qt5_qtsql-master".owner = "riinr";
  inputs."qt5_qtsql-master".repo = "flake-nimble";
  inputs."qt5_qtsql-master".ref = "flake-pinning";
  inputs."qt5_qtsql-master".dir = "nimpkgs/q/qt5_qtsql/master";

    inputs."qt5_qtsql-0_7_0".type = "github";
  inputs."qt5_qtsql-0_7_0".owner = "riinr";
  inputs."qt5_qtsql-0_7_0".repo = "flake-nimble";
  inputs."qt5_qtsql-0_7_0".ref = "flake-pinning";
  inputs."qt5_qtsql-0_7_0".dir = "nimpkgs/q/qt5_qtsql/0_7_0";

    inputs."qt5_qtsql-1_0_0".type = "github";
  inputs."qt5_qtsql-1_0_0".owner = "riinr";
  inputs."qt5_qtsql-1_0_0".repo = "flake-nimble";
  inputs."qt5_qtsql-1_0_0".ref = "flake-pinning";
  inputs."qt5_qtsql-1_0_0".dir = "nimpkgs/q/qt5_qtsql/1_0_0";

    inputs."qt5_qtsql-1_0_1".type = "github";
  inputs."qt5_qtsql-1_0_1".owner = "riinr";
  inputs."qt5_qtsql-1_0_1".repo = "flake-nimble";
  inputs."qt5_qtsql-1_0_1".ref = "flake-pinning";
  inputs."qt5_qtsql-1_0_1".dir = "nimpkgs/q/qt5_qtsql/1_0_1";

    inputs."qt5_qtsql-1_0_2".type = "github";
  inputs."qt5_qtsql-1_0_2".owner = "riinr";
  inputs."qt5_qtsql-1_0_2".repo = "flake-nimble";
  inputs."qt5_qtsql-1_0_2".ref = "flake-pinning";
  inputs."qt5_qtsql-1_0_2".dir = "nimpkgs/q/qt5_qtsql/1_0_2";

    inputs."qt5_qtsql-1_0_3".type = "github";
  inputs."qt5_qtsql-1_0_3".owner = "riinr";
  inputs."qt5_qtsql-1_0_3".repo = "flake-nimble";
  inputs."qt5_qtsql-1_0_3".ref = "flake-pinning";
  inputs."qt5_qtsql-1_0_3".dir = "nimpkgs/q/qt5_qtsql/1_0_3";

    inputs."qt5_qtsql-1_1_0".type = "github";
  inputs."qt5_qtsql-1_1_0".owner = "riinr";
  inputs."qt5_qtsql-1_1_0".repo = "flake-nimble";
  inputs."qt5_qtsql-1_1_0".ref = "flake-pinning";
  inputs."qt5_qtsql-1_1_0".dir = "nimpkgs/q/qt5_qtsql/1_1_0";

    inputs."qt5_qtsql-1_1_1".type = "github";
  inputs."qt5_qtsql-1_1_1".owner = "riinr";
  inputs."qt5_qtsql-1_1_1".repo = "flake-nimble";
  inputs."qt5_qtsql-1_1_1".ref = "flake-pinning";
  inputs."qt5_qtsql-1_1_1".dir = "nimpkgs/q/qt5_qtsql/1_1_1";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}