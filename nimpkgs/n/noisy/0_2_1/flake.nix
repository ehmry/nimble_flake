{
  description = ''SIMD-accelerated noise generation (Simplex, Perlin).'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-noisy-0_2_1.flake = false;
  inputs.src-noisy-0_2_1.type = "github";
  inputs.src-noisy-0_2_1.owner = "guzba";
  inputs.src-noisy-0_2_1.repo = "noisy";
  inputs.src-noisy-0_2_1.ref = "refs/tags/0.2.1";
  inputs.src-noisy-0_2_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-noisy-0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-noisy-0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-noisy-0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}