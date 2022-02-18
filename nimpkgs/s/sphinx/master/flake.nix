{
  description = ''Sphinx wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-sphinx-master.flake = false;
  inputs.src-sphinx-master.type = "github";
  inputs.src-sphinx-master.owner = "Araq";
  inputs.src-sphinx-master.repo = "sphinx";
  inputs.src-sphinx-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-sphinx-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sphinx-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sphinx-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}