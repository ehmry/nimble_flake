{
  description = ''A small but practical concatenative programming language and shell.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-min-v0_19_0.flake = false;
  inputs.src-min-v0_19_0.type = "github";
  inputs.src-min-v0_19_0.owner = "h3rald";
  inputs.src-min-v0_19_0.repo = "min";
  inputs.src-min-v0_19_0.ref = "refs/tags/v0.19.0";
  
  
  inputs."nifty".type = "github";
  inputs."nifty".owner = "riinr";
  inputs."nifty".repo = "flake-nimble";
  inputs."nifty".ref = "flake-pinning";
  inputs."nifty".dir = "nimpkgs/n/nifty";

  outputs = { self, nixpkgs, flakeNimbleLib, src-min-v0_19_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-min-v0_19_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-min-v0_19_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}