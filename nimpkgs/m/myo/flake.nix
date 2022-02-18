{
  description = ''Bindings for the Thalmic Labs Myo gesture control armband SDK.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."myo-master".type = "github";
  inputs."myo-master".owner = "riinr";
  inputs."myo-master".repo = "flake-nimble";
  inputs."myo-master".ref = "flake-pinning";
  inputs."myo-master".dir = "nimpkgs/m/myo/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}