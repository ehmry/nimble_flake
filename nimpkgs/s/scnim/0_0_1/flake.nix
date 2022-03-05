{
  description = ''Develop SuperCollider UGens in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-scnim-0_0_1.flake = false;
  inputs.src-scnim-0_0_1.type = "github";
  inputs.src-scnim-0_0_1.owner = "capocasa";
  inputs.src-scnim-0_0_1.repo = "scnim";
  inputs.src-scnim-0_0_1.ref = "refs/tags/0.0.1";
  inputs.src-scnim-0_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-scnim-0_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-scnim-0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-scnim-0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}