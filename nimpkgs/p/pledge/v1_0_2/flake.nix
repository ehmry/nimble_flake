{
  description = ''OpenBSDs pledge(2) for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pledge-v1_0_2.flake = false;
  inputs.src-pledge-v1_0_2.type = "github";
  inputs.src-pledge-v1_0_2.owner = "euantorano";
  inputs.src-pledge-v1_0_2.repo = "pledge.nim";
  inputs.src-pledge-v1_0_2.ref = "refs/tags/v1.0.2";
  inputs.src-pledge-v1_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-pledge-v1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pledge-v1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pledge-v1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}