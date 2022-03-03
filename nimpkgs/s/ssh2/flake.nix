{
  description = ''SSH, SCP and SFTP client for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."ssh2-master".type = "github";
  inputs."ssh2-master".owner = "riinr";
  inputs."ssh2-master".repo = "flake-nimble";
  inputs."ssh2-master".ref = "flake-pinning";
  inputs."ssh2-master".dir = "nimpkgs/s/ssh2/master";
  inputs."ssh2-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."ssh2-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."ssh2-0_1_0".type = "github";
  inputs."ssh2-0_1_0".owner = "riinr";
  inputs."ssh2-0_1_0".repo = "flake-nimble";
  inputs."ssh2-0_1_0".ref = "flake-pinning";
  inputs."ssh2-0_1_0".dir = "nimpkgs/s/ssh2/0_1_0";
  inputs."ssh2-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."ssh2-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."ssh2-0_1_1".type = "github";
  inputs."ssh2-0_1_1".owner = "riinr";
  inputs."ssh2-0_1_1".repo = "flake-nimble";
  inputs."ssh2-0_1_1".ref = "flake-pinning";
  inputs."ssh2-0_1_1".dir = "nimpkgs/s/ssh2/0_1_1";
  inputs."ssh2-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."ssh2-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}