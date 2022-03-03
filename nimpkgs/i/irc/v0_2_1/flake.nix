{
  description = ''Implements a simple IRC client.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-irc-v0_2_1.flake = false;
  inputs.src-irc-v0_2_1.type = "github";
  inputs.src-irc-v0_2_1.owner = "nim-lang";
  inputs.src-irc-v0_2_1.repo = "irc";
  inputs.src-irc-v0_2_1.ref = "refs/tags/v0.2.1";
  inputs.src-irc-v0_2_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-irc-v0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-irc-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-irc-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}