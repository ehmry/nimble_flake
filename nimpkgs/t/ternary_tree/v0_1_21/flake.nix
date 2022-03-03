{
  description = ''Structural sharing data structure of lists and maps.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-ternary_tree-v0_1_21.flake = false;
  inputs.src-ternary_tree-v0_1_21.type = "github";
  inputs.src-ternary_tree-v0_1_21.owner = "calcit-lang";
  inputs.src-ternary_tree-v0_1_21.repo = "ternary-tree";
  inputs.src-ternary_tree-v0_1_21.ref = "refs/tags/v0.1.21";
  inputs.src-ternary_tree-v0_1_21.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-ternary_tree-v0_1_21, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ternary_tree-v0_1_21;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ternary_tree-v0_1_21"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}