{
  description = ''Pseudo-random number generation library inspired by Python'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-random-v0_5_6.flake = false;
  inputs.src-random-v0_5_6.type = "github";
  inputs.src-random-v0_5_6.owner = "oprypin";
  inputs.src-random-v0_5_6.repo = "nim-random";
  inputs.src-random-v0_5_6.ref = "refs/tags/v0.5.6";
  inputs.src-random-v0_5_6.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-random-v0_5_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-random-v0_5_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-random-v0_5_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}