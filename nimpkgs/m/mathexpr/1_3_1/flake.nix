{
  description = ''MathExpr - pure-Nim mathematical expression evaluator library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mathexpr-1_3_1.flake = false;
  inputs.src-mathexpr-1_3_1.type = "github";
  inputs.src-mathexpr-1_3_1.owner = "Yardanico";
  inputs.src-mathexpr-1_3_1.repo = "nim-mathexpr";
  inputs.src-mathexpr-1_3_1.ref = "refs/tags/1.3.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-mathexpr-1_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mathexpr-1_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mathexpr-1_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}