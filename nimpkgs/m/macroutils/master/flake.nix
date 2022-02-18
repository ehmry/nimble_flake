{
  description = ''A package that makes creating macros easier'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-macroutils-master.flake = false;
  inputs.src-macroutils-master.type = "github";
  inputs.src-macroutils-master.owner = "PMunch";
  inputs.src-macroutils-master.repo = "macroutils";
  inputs.src-macroutils-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-macroutils-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-macroutils-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-macroutils-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}