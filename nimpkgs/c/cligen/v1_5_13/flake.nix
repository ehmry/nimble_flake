{
  description = ''Infer & generate command-line interace/option/argument parsers'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-cligen-v1_5_13.flake = false;
  inputs.src-cligen-v1_5_13.type = "github";
  inputs.src-cligen-v1_5_13.owner = "c-blake";
  inputs.src-cligen-v1_5_13.repo = "cligen";
  inputs.src-cligen-v1_5_13.ref = "refs/tags/v1.5.13";
  inputs.src-cligen-v1_5_13.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-cligen-v1_5_13, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-v1_5_13;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cligen-v1_5_13"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}