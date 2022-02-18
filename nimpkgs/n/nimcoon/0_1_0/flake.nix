{
  description = ''A command-line YouTube player and more'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimcoon-0_1_0.flake = false;
  inputs.src-nimcoon-0_1_0.type = "other";
  inputs.src-nimcoon-0_1_0.owner = "gitweb";
  inputs.src-nimcoon-0_1_0.repo = "nimcoon";
  inputs.src-nimcoon-0_1_0.ref = "refs/tags/0.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimcoon-0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimcoon-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimcoon-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}