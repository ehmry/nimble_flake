{
  description = ''A library providing zero-cost chaining for functional abstractions in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-zero_functional-v0_0_7.flake = false;
  inputs.src-zero_functional-v0_0_7.type = "github";
  inputs.src-zero_functional-v0_0_7.owner = "zero-functional";
  inputs.src-zero_functional-v0_0_7.repo = "zero-functional";
  inputs.src-zero_functional-v0_0_7.ref = "refs/tags/v0.0.7";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-zero_functional-v0_0_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zero_functional-v0_0_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-zero_functional-v0_0_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}