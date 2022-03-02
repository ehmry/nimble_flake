{
  description = ''A simple terminal tetris in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimtetris-v0_3_1.flake = false;
  inputs.src-nimtetris-v0_3_1.type = "github";
  inputs.src-nimtetris-v0_3_1.owner = "jiro4989";
  inputs.src-nimtetris-v0_3_1.repo = "nimtetris";
  inputs.src-nimtetris-v0_3_1.ref = "refs/tags/v0.3.1";
  
  
  inputs."illwill".type = "github";
  inputs."illwill".owner = "riinr";
  inputs."illwill".repo = "flake-nimble";
  inputs."illwill".ref = "flake-pinning";
  inputs."illwill".dir = "nimpkgs/i/illwill";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimtetris-v0_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimtetris-v0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimtetris-v0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}