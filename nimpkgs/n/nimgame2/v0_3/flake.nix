{
  description = ''A simple 2D game engine for Nim language.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimgame2-v0_3.flake = false;
  inputs.src-nimgame2-v0_3.type = "github";
  inputs.src-nimgame2-v0_3.owner = "Vladar4";
  inputs.src-nimgame2-v0_3.repo = "nimgame2";
  inputs.src-nimgame2-v0_3.ref = "refs/tags/v0.3";
  
  
  inputs."sdl2_nim".type = "github";
  inputs."sdl2_nim".owner = "riinr";
  inputs."sdl2_nim".repo = "flake-nimble";
  inputs."sdl2_nim".ref = "flake-pinning";
  inputs."sdl2_nim".dir = "nimpkgs/s/sdl2_nim";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimgame2-v0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimgame2-v0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimgame2-v0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}