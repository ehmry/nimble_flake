{
  description = ''An implementation of the tabu search heuristic in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-syphus-master.flake = false;
  inputs.src-syphus-master.type = "github";
  inputs.src-syphus-master.owner = "makingspace";
  inputs.src-syphus-master.repo = "syphus";
  inputs.src-syphus-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-syphus-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-syphus-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-syphus-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}