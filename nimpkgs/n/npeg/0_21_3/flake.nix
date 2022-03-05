{
  description = ''PEG (Parsing Expression Grammars) string matching library for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-npeg-0_21_3.flake = false;
  inputs.src-npeg-0_21_3.type = "github";
  inputs.src-npeg-0_21_3.owner = "zevv";
  inputs.src-npeg-0_21_3.repo = "npeg";
  inputs.src-npeg-0_21_3.ref = "refs/tags/0.21.3";
  inputs.src-npeg-0_21_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-npeg-0_21_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-npeg-0_21_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-npeg-0_21_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}