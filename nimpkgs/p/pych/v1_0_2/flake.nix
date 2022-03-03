{
  description = ''A tool that watches Python files and re-runs them on change.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pych-v1_0_2.flake = false;
  inputs.src-pych-v1_0_2.type = "github";
  inputs.src-pych-v1_0_2.owner = "rburmorrison";
  inputs.src-pych-v1_0_2.repo = "pych";
  inputs.src-pych-v1_0_2.ref = "refs/tags/v1.0.2";
  inputs.src-pych-v1_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-pych-v1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pych-v1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pych-v1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}