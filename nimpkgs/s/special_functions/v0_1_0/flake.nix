{
  description = ''Special mathematical functions in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-special_functions-v0_1_0.flake = false;
  inputs.src-special_functions-v0_1_0.type = "github";
  inputs.src-special_functions-v0_1_0.owner = "ayman-albaz";
  inputs.src-special_functions-v0_1_0.repo = "special-functions";
  inputs.src-special_functions-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-special_functions-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-special_functions-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-special_functions-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-special_functions-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}