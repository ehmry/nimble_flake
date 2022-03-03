{
  description = ''Migration manager for Norm.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-norman-1_0_1.flake = false;
  inputs.src-norman-1_0_1.type = "github";
  inputs.src-norman-1_0_1.owner = "moigagoo";
  inputs.src-norman-1_0_1.repo = "norman";
  inputs.src-norman-1_0_1.ref = "refs/tags/1.0.1";
  inputs.src-norman-1_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."norm".type = "github";
  # inputs."norm".owner = "riinr";
  # inputs."norm".repo = "flake-nimble";
  # inputs."norm".ref = "flake-pinning";
  # inputs."norm".dir = "nimpkgs/n/norm";
  # inputs."norm".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."norm".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."cligen".type = "github";
  # inputs."cligen".owner = "riinr";
  # inputs."cligen".repo = "flake-nimble";
  # inputs."cligen".ref = "flake-pinning";
  # inputs."cligen".dir = "nimpkgs/c/cligen";
  # inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-norman-1_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-norman-1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-norman-1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}