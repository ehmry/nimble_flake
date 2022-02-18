{
  description = ''Huenim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."huenim-master".type = "github";
  inputs."huenim-master".owner = "riinr";
  inputs."huenim-master".repo = "flake-nimble";
  inputs."huenim-master".ref = "flake-pinning";
  inputs."huenim-master".dir = "nimpkgs/h/huenim/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}