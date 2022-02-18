{
  description = ''Flash ISO images to SD cards & USB drives, safely and easily.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."ballena_itcher-master".type = "github";
  inputs."ballena_itcher-master".owner = "riinr";
  inputs."ballena_itcher-master".repo = "flake-nimble";
  inputs."ballena_itcher-master".ref = "flake-pinning";
  inputs."ballena_itcher-master".dir = "nimpkgs/b/ballena_itcher/master";

    inputs."ballena_itcher-0_0_1".type = "github";
  inputs."ballena_itcher-0_0_1".owner = "riinr";
  inputs."ballena_itcher-0_0_1".repo = "flake-nimble";
  inputs."ballena_itcher-0_0_1".ref = "flake-pinning";
  inputs."ballena_itcher-0_0_1".dir = "nimpkgs/b/ballena_itcher/0_0_1";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}