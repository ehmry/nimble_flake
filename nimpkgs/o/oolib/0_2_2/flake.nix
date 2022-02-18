{
  description = ''A nimble package which provides user-defined types, procedures, etc...'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-oolib-0_2_2.flake = false;
  inputs.src-oolib-0_2_2.type = "github";
  inputs.src-oolib-0_2_2.owner = "glasses-Neo";
  inputs.src-oolib-0_2_2.repo = "OOlib";
  inputs.src-oolib-0_2_2.ref = "refs/tags/0.2.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-oolib-0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oolib-0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-oolib-0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}