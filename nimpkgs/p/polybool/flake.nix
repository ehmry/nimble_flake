{
  description = ''Polygon Clipper Library (Martinez Algorithm)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."polybool-master".type = "github";
  inputs."polybool-master".owner = "riinr";
  inputs."polybool-master".repo = "flake-nimble";
  inputs."polybool-master".ref = "flake-pinning";
  inputs."polybool-master".dir = "nimpkgs/p/polybool/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}