{
  description = ''A simple MurmurHash3 wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-murmur3-v0_1_3.flake = false;
  inputs.src-murmur3-v0_1_3.type = "github";
  inputs.src-murmur3-v0_1_3.owner = "boydgreenfield";
  inputs.src-murmur3-v0_1_3.repo = "nimrod-murmur";
  inputs.src-murmur3-v0_1_3.ref = "refs/tags/v0.1.3";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-murmur3-v0_1_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-murmur3-v0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-murmur3-v0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}