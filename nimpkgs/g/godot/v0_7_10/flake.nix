{
  description = ''Nim bindings for Godot Engine'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-godot-v0_7_10.flake = false;
  inputs.src-godot-v0_7_10.type = "github";
  inputs.src-godot-v0_7_10.owner = "pragmagic";
  inputs.src-godot-v0_7_10.repo = "godot-nim";
  inputs.src-godot-v0_7_10.ref = "refs/tags/v0.7.10";
  
  
  inputs."compiler".type = "github";
  inputs."compiler".owner = "riinr";
  inputs."compiler".repo = "flake-nimble";
  inputs."compiler".ref = "flake-pinning";
  inputs."compiler".dir = "nimpkgs/c/compiler";

  outputs = { self, nixpkgs, flakeNimbleLib, src-godot-v0_7_10, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-godot-v0_7_10;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-godot-v0_7_10"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}