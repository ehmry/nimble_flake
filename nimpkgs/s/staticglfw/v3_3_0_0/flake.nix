{
  description = ''Static GLFW for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-staticglfw-v3_3_0_0.flake = false;
  inputs.src-staticglfw-v3_3_0_0.type = "github";
  inputs.src-staticglfw-v3_3_0_0.owner = "treeform";
  inputs.src-staticglfw-v3_3_0_0.repo = "staticglfw";
  inputs.src-staticglfw-v3_3_0_0.ref = "refs/tags/v3.3.0.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-staticglfw-v3_3_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-staticglfw-v3_3_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-staticglfw-v3_3_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}