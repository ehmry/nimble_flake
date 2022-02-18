{
  description = ''A container runtime written in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."nicoru-develop".type = "github";
  inputs."nicoru-develop".owner = "riinr";
  inputs."nicoru-develop".repo = "flake-nimble";
  inputs."nicoru-develop".ref = "flake-pinning";
  inputs."nicoru-develop".dir = "nimpkgs/n/nicoru/develop";

    inputs."nicoru-main".type = "github";
  inputs."nicoru-main".owner = "riinr";
  inputs."nicoru-main".repo = "flake-nimble";
  inputs."nicoru-main".ref = "flake-pinning";
  inputs."nicoru-main".dir = "nimpkgs/n/nicoru/main";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}