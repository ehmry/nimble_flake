{
  description = ''Compiler package providing the compiler sources as a library.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-compiler-v1_2_16.flake = false;
  inputs.src-compiler-v1_2_16.type = "github";
  inputs.src-compiler-v1_2_16.owner = "nim-lang";
  inputs.src-compiler-v1_2_16.repo = "Nim";
  inputs.src-compiler-v1_2_16.ref = "refs/tags/v1.2.16";
  inputs.src-compiler-v1_2_16.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-compiler-v1_2_16, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-compiler-v1_2_16;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-compiler-v1_2_16"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}