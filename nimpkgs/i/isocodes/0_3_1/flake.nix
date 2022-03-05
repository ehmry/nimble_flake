{
  description = ''ISO codes for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-isocodes-0_3_1.flake = false;
  inputs.src-isocodes-0_3_1.type = "github";
  inputs.src-isocodes-0_3_1.owner = "kraptor";
  inputs.src-isocodes-0_3_1.repo = "isocodes";
  inputs.src-isocodes-0_3_1.ref = "refs/tags/0.3.1";
  inputs.src-isocodes-0_3_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."jsony".type = "github";
  inputs."jsony".owner = "riinr";
  inputs."jsony".repo = "flake-nimble";
  inputs."jsony".ref = "flake-pinning";
  inputs."jsony".dir = "nimpkgs/j/jsony";
  inputs."jsony".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jsony".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."https://github.com/disruptek/bump".type = "github";
  inputs."https://github.com/disruptek/bump".owner = "riinr";
  inputs."https://github.com/disruptek/bump".repo = "flake-nimble";
  inputs."https://github.com/disruptek/bump".ref = "flake-pinning";
  inputs."https://github.com/disruptek/bump".dir = "nimpkgs/h/https://github.com/disruptek/bump";
  inputs."https://github.com/disruptek/bump".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/disruptek/bump".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-isocodes-0_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-isocodes-0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-isocodes-0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}