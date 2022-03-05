{
  description = ''A nimble package which provides user-defined types, procedures, etc...'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-oolib-0_3_0.flake = false;
  inputs.src-oolib-0_3_0.type = "github";
  inputs.src-oolib-0_3_0.owner = "Glasses-Neo";
  inputs.src-oolib-0_3_0.repo = "OOlib";
  inputs.src-oolib-0_3_0.ref = "refs/tags/0.3.0";
  inputs.src-oolib-0_3_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-oolib-0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oolib-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-oolib-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}