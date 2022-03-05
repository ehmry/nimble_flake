{
  description = ''A small but practical concatenative programming language and shell.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-min-v0_18_0.flake = false;
  inputs.src-min-v0_18_0.type = "github";
  inputs.src-min-v0_18_0.owner = "h3rald";
  inputs.src-min-v0_18_0.repo = "min";
  inputs.src-min-v0_18_0.ref = "refs/tags/v0.18.0";
  inputs.src-min-v0_18_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nifty".type = "github";
  inputs."nifty".owner = "riinr";
  inputs."nifty".repo = "flake-nimble";
  inputs."nifty".ref = "flake-pinning";
  inputs."nifty".dir = "nimpkgs/n/nifty";
  inputs."nifty".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nifty".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-min-v0_18_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-min-v0_18_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-min-v0_18_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}