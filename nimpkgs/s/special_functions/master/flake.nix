{
  description = ''Special mathematical functions in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-special_functions-master.flake = false;
  inputs.src-special_functions-master.type = "github";
  inputs.src-special_functions-master.owner = "ayman-albaz";
  inputs.src-special_functions-master.repo = "special-functions";
  inputs.src-special_functions-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-special_functions-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-special_functions-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-special_functions-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}