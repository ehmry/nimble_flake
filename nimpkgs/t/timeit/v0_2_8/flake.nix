{
  description = ''measuring execution times written in nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-timeit-v0_2_8.flake = false;
  inputs.src-timeit-v0_2_8.type = "github";
  inputs.src-timeit-v0_2_8.owner = "xflywind";
  inputs.src-timeit-v0_2_8.repo = "timeit";
  inputs.src-timeit-v0_2_8.ref = "refs/tags/v0.2.8";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-timeit-v0_2_8, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-timeit-v0_2_8;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-timeit-v0_2_8"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}