{
  description = ''Library for converting sequences to strings. Also has PHP-inspired explode and implode procs.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-sequester-master.flake = false;
  inputs.src-sequester-master.type = "github";
  inputs.src-sequester-master.owner = "fallingduck";
  inputs.src-sequester-master.repo = "sequester";
  inputs.src-sequester-master.ref = "refs/heads/master";
  inputs.src-sequester-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-sequester-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sequester-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sequester-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}