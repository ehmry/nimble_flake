{
  description = ''A set of simple modules for writing a JavaScript 2D game.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."gamelight-master".type = "github";
  inputs."gamelight-master".owner = "riinr";
  inputs."gamelight-master".repo = "flake-nimble";
  inputs."gamelight-master".ref = "flake-pinning";
  inputs."gamelight-master".dir = "nimpkgs/g/gamelight/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}