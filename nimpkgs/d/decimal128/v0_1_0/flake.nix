{
  description = ''Decimal type support based on the IEEE 754 2008 specification.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-decimal128-v0_1_0.flake = false;
  inputs.src-decimal128-v0_1_0.type = "github";
  inputs.src-decimal128-v0_1_0.owner = "JohnAD";
  inputs.src-decimal128-v0_1_0.repo = "decimal128";
  inputs.src-decimal128-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-decimal128-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-decimal128-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-decimal128-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-decimal128-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}