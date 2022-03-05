{
  description = ''Termbox wrapper.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."termbox-master".type = "github";
  inputs."termbox-master".owner = "riinr";
  inputs."termbox-master".repo = "flake-nimble";
  inputs."termbox-master".ref = "flake-pinning";
  inputs."termbox-master".dir = "nimpkgs/t/termbox/master";
  inputs."termbox-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."termbox-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}