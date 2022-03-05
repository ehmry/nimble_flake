{
  description = ''A nimble package which provides user-defined types, procedures, etc...'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-oolib-main.flake = false;
  inputs.src-oolib-main.type = "github";
  inputs.src-oolib-main.owner = "Glasses-Neo";
  inputs.src-oolib-main.repo = "OOlib";
  inputs.src-oolib-main.ref = "refs/heads/main";
  inputs.src-oolib-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-oolib-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oolib-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-oolib-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}