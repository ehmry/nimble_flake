{
  description = ''Game rules engine for simulating or playing turn-based games'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-turn_based_game-v1_1_5.flake = false;
  inputs.src-turn_based_game-v1_1_5.type = "github";
  inputs.src-turn_based_game-v1_1_5.owner = "JohnAD";
  inputs.src-turn_based_game-v1_1_5.repo = "turn_based_game";
  inputs.src-turn_based_game-v1_1_5.ref = "refs/tags/v1.1.5";
  inputs.src-turn_based_game-v1_1_5.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-turn_based_game-v1_1_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-turn_based_game-v1_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-turn_based_game-v1_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}