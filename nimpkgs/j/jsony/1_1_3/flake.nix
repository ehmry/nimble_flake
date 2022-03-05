{
  description = ''A loose, direct to object json parser with hooks.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-jsony-1_1_3.flake = false;
  inputs.src-jsony-1_1_3.type = "github";
  inputs.src-jsony-1_1_3.owner = "treeform";
  inputs.src-jsony-1_1_3.repo = "jsony";
  inputs.src-jsony-1_1_3.ref = "refs/tags/1.1.3";
  inputs.src-jsony-1_1_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-jsony-1_1_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jsony-1_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jsony-1_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}