{
  description = ''Interface for reading per bits'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."bitstreams-main".type = "github";
  inputs."bitstreams-main".owner = "riinr";
  inputs."bitstreams-main".repo = "flake-nimble";
  inputs."bitstreams-main".ref = "flake-pinning";
  inputs."bitstreams-main".dir = "nimpkgs/b/bitstreams/main";
  inputs."bitstreams-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bitstreams-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}