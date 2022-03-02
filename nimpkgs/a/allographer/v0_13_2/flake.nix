{
  description = ''A Nim query builder library inspired by Laravel/PHP and Orator/Python'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-allographer-v0_13_2.flake = false;
  inputs.src-allographer-v0_13_2.type = "github";
  inputs.src-allographer-v0_13_2.owner = "itsumura-h";
  inputs.src-allographer-v0_13_2.repo = "nim-allographer";
  inputs.src-allographer-v0_13_2.ref = "refs/tags/v0.13.2";
  inputs.src-allographer-v0_13_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."cligen".type = "github";
  # inputs."cligen".owner = "riinr";
  # inputs."cligen".repo = "flake-nimble";
  # inputs."cligen".ref = "flake-pinning";
  # inputs."cligen".dir = "nimpkgs/c/cligen";
  # inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."progress".type = "github";
  # inputs."progress".owner = "riinr";
  # inputs."progress".repo = "flake-nimble";
  # inputs."progress".ref = "flake-pinning";
  # inputs."progress".dir = "nimpkgs/p/progress";
  # inputs."progress".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."progress".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-allographer-v0_13_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-allographer-v0_13_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-allographer-v0_13_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}