{
  description = ''Dependency-free and performant Nim Snappy implementation.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-supersnappy-2_1_1.flake = false;
  inputs.src-supersnappy-2_1_1.type = "github";
  inputs.src-supersnappy-2_1_1.owner = "guzba";
  inputs.src-supersnappy-2_1_1.repo = "supersnappy";
  inputs.src-supersnappy-2_1_1.ref = "refs/tags/2.1.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-supersnappy-2_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-supersnappy-2_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-supersnappy-2_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}