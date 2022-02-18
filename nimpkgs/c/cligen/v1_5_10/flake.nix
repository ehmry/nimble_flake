{
  description = ''Infer & generate command-line interace/option/argument parsers'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-cligen-v1_5_10.flake = false;
  inputs.src-cligen-v1_5_10.type = "github";
  inputs.src-cligen-v1_5_10.owner = "c-blake";
  inputs.src-cligen-v1_5_10.repo = "cligen";
  inputs.src-cligen-v1_5_10.ref = "refs/tags/v1.5.10";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-cligen-v1_5_10, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-v1_5_10;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cligen-v1_5_10"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}