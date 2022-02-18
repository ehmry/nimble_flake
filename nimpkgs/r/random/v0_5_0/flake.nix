{
  description = ''Pseudo-random number generation library inspired by Python'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-random-v0_5_0.flake = false;
  inputs.src-random-v0_5_0.type = "github";
  inputs.src-random-v0_5_0.owner = "oprypin";
  inputs.src-random-v0_5_0.repo = "nim-random";
  inputs.src-random-v0_5_0.ref = "refs/tags/v0.5.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-random-v0_5_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-random-v0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-random-v0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}