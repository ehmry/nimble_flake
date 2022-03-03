{
  description = ''Infer & generate command-line interace/option/argument parsers'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-cligen-0_9_6.flake = false;
  inputs.src-cligen-0_9_6.type = "github";
  inputs.src-cligen-0_9_6.owner = "c-blake";
  inputs.src-cligen-0_9_6.repo = "cligen";
  inputs.src-cligen-0_9_6.ref = "refs/tags/0.9.6";
  inputs.src-cligen-0_9_6.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-cligen-0_9_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-0_9_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cligen-0_9_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}