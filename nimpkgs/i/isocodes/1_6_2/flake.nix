{
  description = ''ISO codes for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-isocodes-1_6_2.flake = false;
  inputs.src-isocodes-1_6_2.type = "github";
  inputs.src-isocodes-1_6_2.owner = "kraptor";
  inputs.src-isocodes-1_6_2.repo = "isocodes";
  inputs.src-isocodes-1_6_2.ref = "refs/tags/1.6.2";
  
  
  inputs."jsony".type = "github";
  inputs."jsony".owner = "riinr";
  inputs."jsony".repo = "flake-nimble";
  inputs."jsony".ref = "flake-pinning";
  inputs."jsony".dir = "nimpkgs/j/jsony";

  outputs = { self, nixpkgs, flakeNimbleLib, src-isocodes-1_6_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-isocodes-1_6_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-isocodes-1_6_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}