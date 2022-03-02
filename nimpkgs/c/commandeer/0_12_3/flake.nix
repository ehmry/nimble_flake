{
  description = ''Provides a small command line parsing DSL (domain specific language)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-commandeer-0_12_3.flake = false;
  inputs.src-commandeer-0_12_3.type = "github";
  inputs.src-commandeer-0_12_3.owner = "fenekku";
  inputs.src-commandeer-0_12_3.repo = "commandeer";
  inputs.src-commandeer-0_12_3.ref = "refs/tags/0.12.3";
  inputs.src-commandeer-0_12_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-commandeer-0_12_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-commandeer-0_12_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-commandeer-0_12_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}