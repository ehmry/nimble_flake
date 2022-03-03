{
  description = ''interactive command prompt'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."cmd-master".type = "github";
  inputs."cmd-master".owner = "riinr";
  inputs."cmd-master".repo = "flake-nimble";
  inputs."cmd-master".ref = "flake-pinning";
  inputs."cmd-master".dir = "nimpkgs/c/cmd/master";
  inputs."cmd-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cmd-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}