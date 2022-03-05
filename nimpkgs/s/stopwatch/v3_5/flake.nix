{
  description = ''A simple timing library for benchmarking code and other things.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-stopwatch-v3_5.flake = false;
  inputs.src-stopwatch-v3_5.type = "gitlab";
  inputs.src-stopwatch-v3_5.owner = "define-private-public";
  inputs.src-stopwatch-v3_5.repo = "stopwatch";
  inputs.src-stopwatch-v3_5.ref = "refs/tags/v3.5";
  inputs.src-stopwatch-v3_5.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stopwatch-v3_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stopwatch-v3_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stopwatch-v3_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}