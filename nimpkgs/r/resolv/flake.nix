{
  description = ''DNS resolution nimble making use of the native glibc resolv library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."resolv-master".type = "github";
  inputs."resolv-master".owner = "riinr";
  inputs."resolv-master".repo = "flake-nimble";
  inputs."resolv-master".ref = "flake-pinning";
  inputs."resolv-master".dir = "nimpkgs/r/resolv/master";
  inputs."resolv-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."resolv-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}