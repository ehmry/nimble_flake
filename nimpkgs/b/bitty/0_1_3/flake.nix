{
  description = ''Utilities with dealing with 1d and 2d bit arrays.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-bitty-0_1_3.flake = false;
  inputs.src-bitty-0_1_3.type = "github";
  inputs.src-bitty-0_1_3.owner = "treeform";
  inputs.src-bitty-0_1_3.repo = "bitty";
  inputs.src-bitty-0_1_3.ref = "refs/tags/0.1.3";
  inputs.src-bitty-0_1_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-bitty-0_1_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bitty-0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bitty-0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}