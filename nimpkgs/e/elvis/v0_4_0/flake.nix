{
  description = ''The elvis package implements a 'truthy', 'ternary' and a 'coalesce' operator to Nim as syntactic sugar for working with conditional expressions'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-elvis-v0_4_0.flake = false;
  inputs.src-elvis-v0_4_0.type = "github";
  inputs.src-elvis-v0_4_0.owner = "mattaylor";
  inputs.src-elvis-v0_4_0.repo = "elvis";
  inputs.src-elvis-v0_4_0.ref = "refs/tags/v0.4.0";
  inputs.src-elvis-v0_4_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-elvis-v0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-elvis-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-elvis-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}