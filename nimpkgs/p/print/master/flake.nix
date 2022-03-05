{
  description = ''Print is a set of pretty print macros, useful for print-debugging.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-print-master.flake = false;
  inputs.src-print-master.type = "github";
  inputs.src-print-master.owner = "treeform";
  inputs.src-print-master.repo = "print";
  inputs.src-print-master.ref = "refs/heads/master";
  inputs.src-print-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-print-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-print-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-print-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}