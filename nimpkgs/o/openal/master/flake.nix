{
  description = ''An OpenAL wrapper.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-openal-master.flake = false;
  inputs.src-openal-master.type = "github";
  inputs.src-openal-master.owner = "treeform";
  inputs.src-openal-master.repo = "openal";
  inputs.src-openal-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-openal-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-openal-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-openal-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}