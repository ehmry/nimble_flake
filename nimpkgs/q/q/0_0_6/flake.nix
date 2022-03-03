{
  description = ''Simple package for query HTML/XML elements using a CSS3 or jQuery-like selector syntax'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-q-0_0_6.flake = false;
  inputs.src-q-0_0_6.type = "github";
  inputs.src-q-0_0_6.owner = "OpenSystemsLab";
  inputs.src-q-0_0_6.repo = "q.nim";
  inputs.src-q-0_0_6.ref = "refs/tags/0.0.6";
  inputs.src-q-0_0_6.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-q-0_0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-q-0_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-q-0_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}