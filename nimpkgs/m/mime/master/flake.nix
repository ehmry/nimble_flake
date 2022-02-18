{
  description = ''Library for attaching files to emails.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mime-master.flake = false;
  inputs.src-mime-master.type = "github";
  inputs.src-mime-master.owner = "enthus1ast";
  inputs.src-mime-master.repo = "nimMime";
  inputs.src-mime-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-mime-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mime-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mime-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}