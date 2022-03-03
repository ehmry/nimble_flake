{
  description = ''Nim implementation of minhash algoritim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."minhash-master".type = "github";
  inputs."minhash-master".owner = "riinr";
  inputs."minhash-master".repo = "flake-nimble";
  inputs."minhash-master".ref = "flake-pinning";
  inputs."minhash-master".dir = "nimpkgs/m/minhash/master";
  inputs."minhash-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."minhash-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}