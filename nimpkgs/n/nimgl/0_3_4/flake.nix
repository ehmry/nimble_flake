{
  description = ''Nim Game Library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimgl-0_3_4.flake = false;
  inputs.src-nimgl-0_3_4.type = "github";
  inputs.src-nimgl-0_3_4.owner = "nimgl";
  inputs.src-nimgl-0_3_4.repo = "nimgl";
  inputs.src-nimgl-0_3_4.ref = "refs/tags/0.3.4";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimgl-0_3_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimgl-0_3_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimgl-0_3_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}