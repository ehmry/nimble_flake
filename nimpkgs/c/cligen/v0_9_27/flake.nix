{
  description = ''Infer & generate command-line interace/option/argument parsers'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-cligen-v0_9_27.flake = false;
  inputs.src-cligen-v0_9_27.type = "github";
  inputs.src-cligen-v0_9_27.owner = "c-blake";
  inputs.src-cligen-v0_9_27.repo = "cligen";
  inputs.src-cligen-v0_9_27.ref = "refs/tags/v0.9.27";
  inputs.src-cligen-v0_9_27.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-cligen-v0_9_27, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-v0_9_27;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cligen-v0_9_27"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}