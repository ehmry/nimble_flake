{
  description = ''See pictures in your console'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."imgcat-master".type = "github";
  inputs."imgcat-master".owner = "riinr";
  inputs."imgcat-master".repo = "flake-nimble";
  inputs."imgcat-master".ref = "flake-pinning";
  inputs."imgcat-master".dir = "nimpkgs/i/imgcat/master";
  inputs."imgcat-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."imgcat-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}