{
  description = ''POP3 client library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."pop3-master".type = "github";
  inputs."pop3-master".owner = "riinr";
  inputs."pop3-master".repo = "flake-nimble";
  inputs."pop3-master".ref = "flake-pinning";
  inputs."pop3-master".dir = "nimpkgs/p/pop3/master";
  inputs."pop3-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."pop3-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."pop3-0_1_1".type = "github";
  inputs."pop3-0_1_1".owner = "riinr";
  inputs."pop3-0_1_1".repo = "flake-nimble";
  inputs."pop3-0_1_1".ref = "flake-pinning";
  inputs."pop3-0_1_1".dir = "nimpkgs/p/pop3/0_1_1";
  inputs."pop3-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."pop3-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}