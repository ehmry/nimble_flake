{
  description = ''A Beautiful Markdown Parser in the Nim World.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-markdown-v0_5_2.flake = false;
  inputs.src-markdown-v0_5_2.type = "github";
  inputs.src-markdown-v0_5_2.owner = "soasme";
  inputs.src-markdown-v0_5_2.repo = "nim-markdown";
  inputs.src-markdown-v0_5_2.ref = "refs/tags/v0.5.2";
  inputs.src-markdown-v0_5_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-markdown-v0_5_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-markdown-v0_5_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-markdown-v0_5_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}