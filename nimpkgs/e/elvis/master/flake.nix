{
  description = ''The elvis package implements a 'truthy', 'ternary' and a 'coalesce' operator to Nim as syntactic sugar for working with conditional expressions'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-elvis-master.flake = false;
  inputs.src-elvis-master.type = "github";
  inputs.src-elvis-master.owner = "mattaylor";
  inputs.src-elvis-master.repo = "elvis";
  inputs.src-elvis-master.ref = "refs/heads/master";
  inputs.src-elvis-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-elvis-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-elvis-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-elvis-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}