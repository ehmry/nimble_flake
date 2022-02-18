{
  description = ''Small, dependency-free, fast Nim package (and CLI tool) for removing tracking fields from URLs.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-unalix-v0_4.flake = false;
  inputs.src-unalix-v0_4.type = "github";
  inputs.src-unalix-v0_4.owner = "AmanoTeam";
  inputs.src-unalix-v0_4.repo = "unalix-nim";
  inputs.src-unalix-v0_4.ref = "refs/tags/v0.4";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-unalix-v0_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-unalix-v0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-unalix-v0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}