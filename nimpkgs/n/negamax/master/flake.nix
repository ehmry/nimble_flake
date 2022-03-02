{
  description = ''Negamax AI search-tree algorithm for two player games'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-negamax-master.flake = false;
  inputs.src-negamax-master.type = "github";
  inputs.src-negamax-master.owner = "JohnAD";
  inputs.src-negamax-master.repo = "negamax";
  inputs.src-negamax-master.ref = "refs/heads/master";
  
  
  inputs."turn_based_game".type = "github";
  inputs."turn_based_game".owner = "riinr";
  inputs."turn_based_game".repo = "flake-nimble";
  inputs."turn_based_game".ref = "flake-pinning";
  inputs."turn_based_game".dir = "nimpkgs/t/turn_based_game";

  outputs = { self, nixpkgs, flakeNimbleLib, src-negamax-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-negamax-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-negamax-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}