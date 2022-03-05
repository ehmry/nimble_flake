{
  description = ''"pointers" to cached AST that instantiate routines when called'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-applicates-0_1_1.flake = false;
  inputs.src-applicates-0_1_1.type = "github";
  inputs.src-applicates-0_1_1.owner = "metagn";
  inputs.src-applicates-0_1_1.repo = "applicates";
  inputs.src-applicates-0_1_1.ref = "refs/tags/0.1.1";
  inputs.src-applicates-0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-applicates-0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-applicates-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-applicates-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}