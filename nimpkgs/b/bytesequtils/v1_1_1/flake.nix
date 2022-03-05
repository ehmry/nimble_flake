{
  description = ''Nim package to manipulate buffer as either seq[byte] or string'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-bytesequtils-v1_1_1.flake = false;
  inputs.src-bytesequtils-v1_1_1.type = "github";
  inputs.src-bytesequtils-v1_1_1.owner = "Clonkk";
  inputs.src-bytesequtils-v1_1_1.repo = "bytesequtils";
  inputs.src-bytesequtils-v1_1_1.ref = "refs/tags/v1.1.1";
  inputs.src-bytesequtils-v1_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-bytesequtils-v1_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bytesequtils-v1_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bytesequtils-v1_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}