{
  description = ''Compiler package providing the compiler sources as a library.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-compiler-v1_2_18.flake = false;
  inputs.src-compiler-v1_2_18.type = "github";
  inputs.src-compiler-v1_2_18.owner = "nim-lang";
  inputs.src-compiler-v1_2_18.repo = "Nim";
  inputs.src-compiler-v1_2_18.ref = "refs/tags/v1.2.18";
  inputs.src-compiler-v1_2_18.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-compiler-v1_2_18, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-compiler-v1_2_18;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-compiler-v1_2_18"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}