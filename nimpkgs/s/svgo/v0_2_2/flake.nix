{
  description = ''SVG output from a shell.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-svgo-v0_2_2.flake = false;
  inputs.src-svgo-v0_2_2.type = "github";
  inputs.src-svgo-v0_2_2.owner = "jiro4989";
  inputs.src-svgo-v0_2_2.repo = "svgo";
  inputs.src-svgo-v0_2_2.ref = "refs/tags/v0.2.2";
  inputs.src-svgo-v0_2_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."cligen".type = "github";
  # inputs."cligen".owner = "riinr";
  # inputs."cligen".repo = "flake-nimble";
  # inputs."cligen".ref = "flake-pinning";
  # inputs."cligen".dir = "nimpkgs/c/cligen";
  # inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-svgo-v0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-svgo-v0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-svgo-v0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}