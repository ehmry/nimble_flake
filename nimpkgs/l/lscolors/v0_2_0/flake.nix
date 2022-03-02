{
  description = ''A library for colorizing paths according to LS_COLORS'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-lscolors-v0_2_0.flake = false;
  inputs.src-lscolors-v0_2_0.type = "github";
  inputs.src-lscolors-v0_2_0.owner = "joachimschmidt557";
  inputs.src-lscolors-v0_2_0.repo = "nim-lscolors";
  inputs.src-lscolors-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-lscolors-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lscolors-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-lscolors-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}