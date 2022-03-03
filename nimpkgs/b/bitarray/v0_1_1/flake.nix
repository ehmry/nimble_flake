{
  description = ''mmap-backed bitarray implementation in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-bitarray-v0_1_1.flake = false;
  inputs.src-bitarray-v0_1_1.type = "github";
  inputs.src-bitarray-v0_1_1.owner = "onecodex";
  inputs.src-bitarray-v0_1_1.repo = "nim-bitarray";
  inputs.src-bitarray-v0_1_1.ref = "refs/tags/v0.1.1";
  inputs.src-bitarray-v0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-bitarray-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bitarray-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bitarray-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}