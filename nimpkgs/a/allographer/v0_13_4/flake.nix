{
  description = ''A Nim query builder library inspired by Laravel/PHP and Orator/Python'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-allographer-v0_13_4.flake = false;
  inputs.src-allographer-v0_13_4.type = "github";
  inputs.src-allographer-v0_13_4.owner = "itsumura-h";
  inputs.src-allographer-v0_13_4.repo = "nim-allographer";
  inputs.src-allographer-v0_13_4.ref = "refs/tags/v0.13.4";
  inputs.src-allographer-v0_13_4.inputs.nixpkgs.follows = "nixpkgs";
  
  
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

  outputs = { self, nixpkgs, flakeNimbleLib, src-allographer-v0_13_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-allographer-v0_13_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-allographer-v0_13_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}