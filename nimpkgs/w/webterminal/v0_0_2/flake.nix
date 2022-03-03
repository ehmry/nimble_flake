{
  description = ''Very simple browser Javascript TTY web terminal'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-webterminal-v0_0_2.flake = false;
  inputs.src-webterminal-v0_0_2.type = "github";
  inputs.src-webterminal-v0_0_2.owner = "JohnAD";
  inputs.src-webterminal-v0_0_2.repo = "webterminal";
  inputs.src-webterminal-v0_0_2.ref = "refs/tags/v0.0.2";
  inputs.src-webterminal-v0_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-webterminal-v0_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-webterminal-v0_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-webterminal-v0_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}