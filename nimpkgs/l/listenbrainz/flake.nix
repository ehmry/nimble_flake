{
  description = ''Low-level multisync bindings to the ListenBrainz web API.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."listenbrainz-master".type = "github";
  inputs."listenbrainz-master".owner = "riinr";
  inputs."listenbrainz-master".repo = "flake-nimble";
  inputs."listenbrainz-master".ref = "flake-pinning";
  inputs."listenbrainz-master".dir = "nimpkgs/l/listenbrainz/master";
  inputs."listenbrainz-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."listenbrainz-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."listenbrainz-0_1_0".type = "github";
  inputs."listenbrainz-0_1_0".owner = "riinr";
  inputs."listenbrainz-0_1_0".repo = "flake-nimble";
  inputs."listenbrainz-0_1_0".ref = "flake-pinning";
  inputs."listenbrainz-0_1_0".dir = "nimpkgs/l/listenbrainz/0_1_0";
  inputs."listenbrainz-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."listenbrainz-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."listenbrainz-0_1_1".type = "github";
  inputs."listenbrainz-0_1_1".owner = "riinr";
  inputs."listenbrainz-0_1_1".repo = "flake-nimble";
  inputs."listenbrainz-0_1_1".ref = "flake-pinning";
  inputs."listenbrainz-0_1_1".dir = "nimpkgs/l/listenbrainz/0_1_1";
  inputs."listenbrainz-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."listenbrainz-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."listenbrainz-0_1_2".type = "github";
  inputs."listenbrainz-0_1_2".owner = "riinr";
  inputs."listenbrainz-0_1_2".repo = "flake-nimble";
  inputs."listenbrainz-0_1_2".ref = "flake-pinning";
  inputs."listenbrainz-0_1_2".dir = "nimpkgs/l/listenbrainz/0_1_2";
  inputs."listenbrainz-0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."listenbrainz-0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."listenbrainz-0_2".type = "github";
  inputs."listenbrainz-0_2".owner = "riinr";
  inputs."listenbrainz-0_2".repo = "flake-nimble";
  inputs."listenbrainz-0_2".ref = "flake-pinning";
  inputs."listenbrainz-0_2".dir = "nimpkgs/l/listenbrainz/0_2";
  inputs."listenbrainz-0_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."listenbrainz-0_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."listenbrainz-0_2_1".type = "github";
  inputs."listenbrainz-0_2_1".owner = "riinr";
  inputs."listenbrainz-0_2_1".repo = "flake-nimble";
  inputs."listenbrainz-0_2_1".ref = "flake-pinning";
  inputs."listenbrainz-0_2_1".dir = "nimpkgs/l/listenbrainz/0_2_1";
  inputs."listenbrainz-0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."listenbrainz-0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}