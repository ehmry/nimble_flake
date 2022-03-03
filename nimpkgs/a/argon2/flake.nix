{
  description = ''A nim wrapper for the Argon2 hashing library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."argon2-master".type = "github";
  inputs."argon2-master".owner = "riinr";
  inputs."argon2-master".repo = "flake-nimble";
  inputs."argon2-master".ref = "flake-pinning";
  inputs."argon2-master".dir = "nimpkgs/a/argon2/master";
  inputs."argon2-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."argon2-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."argon2-v1_0_0".type = "github";
  inputs."argon2-v1_0_0".owner = "riinr";
  inputs."argon2-v1_0_0".repo = "flake-nimble";
  inputs."argon2-v1_0_0".ref = "flake-pinning";
  inputs."argon2-v1_0_0".dir = "nimpkgs/a/argon2/v1_0_0";
  inputs."argon2-v1_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."argon2-v1_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."argon2-v1_0_1".type = "github";
  inputs."argon2-v1_0_1".owner = "riinr";
  inputs."argon2-v1_0_1".repo = "flake-nimble";
  inputs."argon2-v1_0_1".ref = "flake-pinning";
  inputs."argon2-v1_0_1".dir = "nimpkgs/a/argon2/v1_0_1";
  inputs."argon2-v1_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."argon2-v1_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}