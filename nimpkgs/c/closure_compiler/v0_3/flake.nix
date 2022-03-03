{
  description = ''Bindings for Closure Compiler web API.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-closure_compiler-v0_3.flake = false;
  inputs.src-closure_compiler-v0_3.type = "github";
  inputs.src-closure_compiler-v0_3.owner = "yglukhov";
  inputs.src-closure_compiler-v0_3.repo = "closure_compiler";
  inputs.src-closure_compiler-v0_3.ref = "refs/tags/v0.3";
  inputs.src-closure_compiler-v0_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-closure_compiler-v0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-closure_compiler-v0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-closure_compiler-v0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}