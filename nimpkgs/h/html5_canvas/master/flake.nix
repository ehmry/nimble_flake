{
  description = ''HTML5 Canvas and drawing for the JavaScript backend.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-html5_canvas-master.flake = false;
  inputs.src-html5_canvas-master.type = "gitlab";
  inputs.src-html5_canvas-master.owner = "define-private-public";
  inputs.src-html5_canvas-master.repo = "HTML5-Canvas-Nim";
  inputs.src-html5_canvas-master.ref = "refs/heads/master";
  inputs.src-html5_canvas-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-html5_canvas-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-html5_canvas-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-html5_canvas-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}