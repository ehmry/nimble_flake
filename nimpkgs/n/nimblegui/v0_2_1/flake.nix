{
  description = ''A simple GUI front for Nimble.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimblegui-v0_2_1.flake = false;
  inputs.src-nimblegui-v0_2_1.type = "github";
  inputs.src-nimblegui-v0_2_1.owner = "ThomasTJdev";
  inputs.src-nimblegui-v0_2_1.repo = "nim_nimble_gui";
  inputs.src-nimblegui-v0_2_1.ref = "refs/tags/v0.2.1";
  inputs.src-nimblegui-v0_2_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."webgui".type = "github";
  # inputs."webgui".owner = "riinr";
  # inputs."webgui".repo = "flake-nimble";
  # inputs."webgui".ref = "flake-pinning";
  # inputs."webgui".dir = "nimpkgs/w/webgui";
  # inputs."webgui".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."webgui".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimblegui-v0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimblegui-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimblegui-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}