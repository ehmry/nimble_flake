{
  description = ''Develop SuperCollider UGens in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-scnim-0_0_1.flake = false;
  inputs.src-scnim-0_0_1.type = "github";
  inputs.src-scnim-0_0_1.owner = "capocasa";
  inputs.src-scnim-0_0_1.repo = "scnim";
  inputs.src-scnim-0_0_1.ref = "refs/tags/0.0.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-scnim-0_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-scnim-0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-scnim-0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}