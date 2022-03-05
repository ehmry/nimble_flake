{
  description = ''Benchmarking wrapper around getrusage()'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-getr-master.flake = false;
  inputs.src-getr-master.type = "github";
  inputs.src-getr-master.owner = "jrfondren";
  inputs.src-getr-master.repo = "getr-nim";
  inputs.src-getr-master.ref = "refs/heads/master";
  inputs.src-getr-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-getr-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-getr-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-getr-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}