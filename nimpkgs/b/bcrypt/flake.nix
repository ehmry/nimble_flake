{
  description = ''Wraps the bcrypt (blowfish) library for creating encrypted hashes (useful for passwords)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."bcrypt-master".type = "github";
  inputs."bcrypt-master".owner = "riinr";
  inputs."bcrypt-master".repo = "flake-nimble";
  inputs."bcrypt-master".ref = "flake-pinning";
  inputs."bcrypt-master".dir = "nimpkgs/b/bcrypt/master";
  inputs."bcrypt-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bcrypt-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}