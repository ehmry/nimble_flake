{
  description = ''A Nim implementation of Simon Cooke's Bip Buffer. A type of circular buffer ensuring contiguous blocks of memory'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."bipbuffer-master".type = "github";
  inputs."bipbuffer-master".owner = "riinr";
  inputs."bipbuffer-master".repo = "flake-nimble";
  inputs."bipbuffer-master".ref = "flake-pinning";
  inputs."bipbuffer-master".dir = "nimpkgs/b/bipbuffer/master";
  inputs."bipbuffer-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bipbuffer-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}