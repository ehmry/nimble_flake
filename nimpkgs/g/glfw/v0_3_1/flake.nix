{
  description = ''A high-level GLFW 3 wrapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-glfw-v0_3_1.flake = false;
  inputs.src-glfw-v0_3_1.type = "github";
  inputs.src-glfw-v0_3_1.owner = "johnnovak";
  inputs.src-glfw-v0_3_1.repo = "nim-glfw";
  inputs.src-glfw-v0_3_1.ref = "refs/tags/v0.3.1";
  inputs.src-glfw-v0_3_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-glfw-v0_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-glfw-v0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-glfw-v0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}