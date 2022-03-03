{
  description = ''Provides a small command line parsing DSL (domain specific language)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-commandeer-0_9_1.flake = false;
  inputs.src-commandeer-0_9_1.type = "github";
  inputs.src-commandeer-0_9_1.owner = "fenekku";
  inputs.src-commandeer-0_9_1.repo = "commandeer";
  inputs.src-commandeer-0_9_1.ref = "refs/tags/0.9.1";
  inputs.src-commandeer-0_9_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-commandeer-0_9_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-commandeer-0_9_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-commandeer-0_9_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}