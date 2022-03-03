{
  description = ''A Nim client for Todoist's REST API'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."todoist-main".type = "github";
  inputs."todoist-main".owner = "riinr";
  inputs."todoist-main".repo = "flake-nimble";
  inputs."todoist-main".ref = "flake-pinning";
  inputs."todoist-main".dir = "nimpkgs/t/todoist/main";
  inputs."todoist-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."todoist-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."todoist-v0_1_0".type = "github";
  inputs."todoist-v0_1_0".owner = "riinr";
  inputs."todoist-v0_1_0".repo = "flake-nimble";
  inputs."todoist-v0_1_0".ref = "flake-pinning";
  inputs."todoist-v0_1_0".dir = "nimpkgs/t/todoist/v0_1_0";
  inputs."todoist-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."todoist-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


    inputs."todoist-v0_1_1".type = "github";
  inputs."todoist-v0_1_1".owner = "riinr";
  inputs."todoist-v0_1_1".repo = "flake-nimble";
  inputs."todoist-v0_1_1".ref = "flake-pinning";
  inputs."todoist-v0_1_1".dir = "nimpkgs/t/todoist/v0_1_1";
  inputs."todoist-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."todoist-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}