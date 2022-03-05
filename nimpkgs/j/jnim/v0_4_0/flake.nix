{
  description = ''Nim - Java bridge'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-jnim-v0_4_0.flake = false;
  inputs.src-jnim-v0_4_0.type = "github";
  inputs.src-jnim-v0_4_0.owner = "yglukhov";
  inputs.src-jnim-v0_4_0.repo = "jnim";
  inputs.src-jnim-v0_4_0.ref = "refs/tags/v0.4.0";
  inputs.src-jnim-v0_4_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimfp".type = "github";
  inputs."nimfp".owner = "riinr";
  inputs."nimfp".repo = "flake-nimble";
  inputs."nimfp".ref = "flake-pinning";
  inputs."nimfp".dir = "nimpkgs/n/nimfp";
  inputs."nimfp".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimfp".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-jnim-v0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jnim-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jnim-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}