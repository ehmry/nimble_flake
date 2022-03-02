{
  description = ''A simple GUI front for Nimble.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimblegui-v0_1_2.flake = false;
  inputs.src-nimblegui-v0_1_2.type = "github";
  inputs.src-nimblegui-v0_1_2.owner = "ThomasTJdev";
  inputs.src-nimblegui-v0_1_2.repo = "nim_nimble_gui";
  inputs.src-nimblegui-v0_1_2.ref = "refs/tags/v0.1.2";
  
  
  inputs."uibuilder".type = "github";
  inputs."uibuilder".owner = "riinr";
  inputs."uibuilder".repo = "flake-nimble";
  inputs."uibuilder".ref = "flake-pinning";
  inputs."uibuilder".dir = "nimpkgs/u/uibuilder";

  
  inputs."ui".type = "github";
  inputs."ui".owner = "riinr";
  inputs."ui".repo = "flake-nimble";
  inputs."ui".ref = "flake-pinning";
  inputs."ui".dir = "nimpkgs/u/ui";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimblegui-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimblegui-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimblegui-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}