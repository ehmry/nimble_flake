{
  description = ''A utility library to find the directory you need to app in.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."appdirs-master".type = "github";
  inputs."appdirs-master".owner = "riinr";
  inputs."appdirs-master".repo = "flake-nimble";
  inputs."appdirs-master".ref = "flake-pinning";
  inputs."appdirs-master".dir = "nimpkgs/a/appdirs/master";

    inputs."appdirs-0_1_0".type = "github";
  inputs."appdirs-0_1_0".owner = "riinr";
  inputs."appdirs-0_1_0".repo = "flake-nimble";
  inputs."appdirs-0_1_0".ref = "flake-pinning";
  inputs."appdirs-0_1_0".dir = "nimpkgs/a/appdirs/0_1_0";

    inputs."appdirs-0_1_1".type = "github";
  inputs."appdirs-0_1_1".owner = "riinr";
  inputs."appdirs-0_1_1".repo = "flake-nimble";
  inputs."appdirs-0_1_1".ref = "flake-pinning";
  inputs."appdirs-0_1_1".dir = "nimpkgs/a/appdirs/0_1_1";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}