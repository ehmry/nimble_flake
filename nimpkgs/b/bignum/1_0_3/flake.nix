{
  description = ''Wrapper around the GMP bindings for the Nim language.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-bignum-1_0_3.flake = false;
  inputs.src-bignum-1_0_3.type = "github";
  inputs.src-bignum-1_0_3.owner = "SciNim";
  inputs.src-bignum-1_0_3.repo = "bignum";
  inputs.src-bignum-1_0_3.ref = "refs/tags/1.0.3";
  inputs.src-bignum-1_0_3.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."gmp".type = "github";
  # inputs."gmp".owner = "riinr";
  # inputs."gmp".repo = "flake-nimble";
  # inputs."gmp".ref = "flake-pinning";
  # inputs."gmp".dir = "nimpkgs/g/gmp";
  # inputs."gmp".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."gmp".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-bignum-1_0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bignum-1_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bignum-1_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}