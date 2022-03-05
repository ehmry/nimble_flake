{
  description = ''Text generator, based on Markov Chains (Markov text generator)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimkov-master.flake = false;
  inputs.src-nimkov-master.type = "github";
  inputs.src-nimkov-master.owner = "bit0r1n";
  inputs.src-nimkov-master.repo = "nimkov";
  inputs.src-nimkov-master.ref = "refs/heads/master";
  inputs.src-nimkov-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimkov-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimkov-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimkov-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}