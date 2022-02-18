{
  description = ''Windows resource file generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  
    inputs."winres-v0_1_0".type = "github";
  inputs."winres-v0_1_0".owner = "riinr";
  inputs."winres-v0_1_0".repo = "flake-nimble";
  inputs."winres-v0_1_0".ref = "flake-pinning";
  inputs."winres-v0_1_0".dir = "nimpkgs/w/winres/v0_1_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}