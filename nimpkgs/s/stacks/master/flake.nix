{
  description = ''Pure Nim stack implementation based on sequences.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-stacks-master.flake = false;
  inputs.src-stacks-master.type = "github";
  inputs.src-stacks-master.owner = "rustomax";
  inputs.src-stacks-master.repo = "nim-stacks";
  inputs.src-stacks-master.ref = "refs/heads/master";
  inputs.src-stacks-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stacks-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stacks-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stacks-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}