{
  description = ''Generated Nim's API docs in markdown for github's README.md files. Great for small libraries with simple APIs.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-mddoc-0_0_4.flake = false;
  inputs.src-mddoc-0_0_4.type = "github";
  inputs.src-mddoc-0_0_4.owner = "treeform";
  inputs.src-mddoc-0_0_4.repo = "mddoc";
  inputs.src-mddoc-0_0_4.ref = "refs/tags/0.0.4";
  inputs.src-mddoc-0_0_4.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-mddoc-0_0_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mddoc-0_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mddoc-0_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}