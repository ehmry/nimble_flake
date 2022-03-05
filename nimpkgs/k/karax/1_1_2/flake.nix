{
  description = ''Karax is a framework for developing single page applications in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-karax-1_1_2.flake = false;
  inputs.src-karax-1_1_2.type = "github";
  inputs.src-karax-1_1_2.owner = "karaxnim";
  inputs.src-karax-1_1_2.repo = "karax";
  inputs.src-karax-1_1_2.ref = "refs/tags/1.1.2";
  inputs.src-karax-1_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-karax-1_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-karax-1_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-karax-1_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}