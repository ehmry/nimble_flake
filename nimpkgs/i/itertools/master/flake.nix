{
  description = ''Itertools for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-itertools-master.flake = false;
  inputs.src-itertools-master.type = "github";
  inputs.src-itertools-master.owner = "narimiran";
  inputs.src-itertools-master.repo = "itertools";
  inputs.src-itertools-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-itertools-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-itertools-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-itertools-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}