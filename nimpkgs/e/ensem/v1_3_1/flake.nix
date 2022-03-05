{
  description = ''Support for ensemble file format and arithmetic using jackknife/bootstrap propagation of errors'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-ensem-v1_3_1.flake = false;
  inputs.src-ensem-v1_3_1.type = "github";
  inputs.src-ensem-v1_3_1.owner = "JeffersonLab";
  inputs.src-ensem-v1_3_1.repo = "ensem";
  inputs.src-ensem-v1_3_1.ref = "refs/tags/v1.3.1";
  inputs.src-ensem-v1_3_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-ensem-v1_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ensem-v1_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ensem-v1_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}