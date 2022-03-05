{
  description = ''Moss (Measure of Software Similarity) implementation in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-moss_nim-main.flake = false;
  inputs.src-moss_nim-main.type = "github";
  inputs.src-moss_nim-main.owner = "D4D3VD4V3";
  inputs.src-moss_nim-main.repo = "moss_nim";
  inputs.src-moss_nim-main.ref = "refs/heads/main";
  inputs.src-moss_nim-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-moss_nim-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-moss_nim-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-moss_nim-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}