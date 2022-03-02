{
  description = ''a tiny tool to bump nimble versions'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-bump-1_3_4.flake = false;
  inputs.src-bump-1_3_4.type = "github";
  inputs.src-bump-1_3_4.owner = "disruptek";
  inputs.src-bump-1_3_4.repo = "bump";
  inputs.src-bump-1_3_4.ref = "refs/tags/1.3.4";
  inputs.src-bump-1_3_4.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."cligen".type = "github";
  # inputs."cligen".owner = "riinr";
  # inputs."cligen".repo = "flake-nimble";
  # inputs."cligen".ref = "flake-pinning";
  # inputs."cligen".dir = "nimpkgs/c/cligen";
  # inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-bump-1_3_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bump-1_3_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bump-1_3_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}