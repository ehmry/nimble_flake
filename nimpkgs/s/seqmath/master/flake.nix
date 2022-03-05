{
  description = ''Nim math library for sequences and nested sequences (extends math library)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-seqmath-master.flake = false;
  inputs.src-seqmath-master.type = "github";
  inputs.src-seqmath-master.owner = "jlp765";
  inputs.src-seqmath-master.repo = "seqmath";
  inputs.src-seqmath-master.ref = "refs/heads/master";
  inputs.src-seqmath-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-seqmath-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-seqmath-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-seqmath-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}