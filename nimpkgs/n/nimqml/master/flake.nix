{
  description = ''Qt Qml bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimqml-master.flake = false;
  inputs.src-nimqml-master.type = "github";
  inputs.src-nimqml-master.owner = "filcuc";
  inputs.src-nimqml-master.repo = "nimqml";
  inputs.src-nimqml-master.ref = "refs/heads/master";
  inputs.src-nimqml-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimqml-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimqml-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimqml-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}