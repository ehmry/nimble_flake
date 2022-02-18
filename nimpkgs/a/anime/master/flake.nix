{
  description = ''The Nim wrapper for tracemoe.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-anime-master.flake = false;
  inputs.src-anime-master.type = "github";
  inputs.src-anime-master.owner = "ethosa";
  inputs.src-anime-master.repo = "anime";
  inputs.src-anime-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-anime-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-anime-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-anime-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}