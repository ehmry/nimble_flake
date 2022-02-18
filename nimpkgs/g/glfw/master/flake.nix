{
  description = ''A high-level GLFW 3 wrapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-glfw-master.flake = false;
  inputs.src-glfw-master.type = "github";
  inputs.src-glfw-master.owner = "johnnovak";
  inputs.src-glfw-master.repo = "nim-glfw";
  inputs.src-glfw-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-glfw-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-glfw-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-glfw-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}