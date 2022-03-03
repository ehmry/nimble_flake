{
  description = ''Binding for Qt 5's Qt SQL library that integrates with the features of the Nim language. Uses one API for multiple database engines.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-qt5_qtsql-0_7_0.flake = false;
  inputs.src-qt5_qtsql-0_7_0.type = "github";
  inputs.src-qt5_qtsql-0_7_0.owner = "philip-wernersbach";
  inputs.src-qt5_qtsql-0_7_0.repo = "nim-qt5_qtsql";
  inputs.src-qt5_qtsql-0_7_0.ref = "refs/tags/0.7.0";
  inputs.src-qt5_qtsql-0_7_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-qt5_qtsql-0_7_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-qt5_qtsql-0_7_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-qt5_qtsql-0_7_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}