{
  description = ''Godot-Nim Utility - Godot gamedev with Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-gnu-main.flake = false;
  inputs.src-gnu-main.type = "github";
  inputs.src-gnu-main.owner = "tonogram";
  inputs.src-gnu-main.repo = "gnu";
  inputs.src-gnu-main.ref = "refs/heads/main";
  
  
  inputs."godot".type = "github";
  inputs."godot".owner = "riinr";
  inputs."godot".repo = "flake-nimble";
  inputs."godot".ref = "flake-pinning";
  inputs."godot".dir = "nimpkgs/g/godot";

  
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, flakeNimbleLib, src-gnu-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gnu-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gnu-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}