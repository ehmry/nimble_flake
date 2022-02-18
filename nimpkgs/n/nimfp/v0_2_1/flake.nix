{
  description = ''Nim functional programming library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimfp-v0_2_1.flake = false;
  inputs.src-nimfp-v0_2_1.type = "github";
  inputs.src-nimfp-v0_2_1.owner = "vegansk";
  inputs.src-nimfp-v0_2_1.repo = "nimfp";
  inputs.src-nimfp-v0_2_1.ref = "refs/tags/v0.2.1";
  
  
  inputs."nimboost".type = "github";
  inputs."nimboost".owner = "riinr";
  inputs."nimboost".repo = "flake-nimble";
  inputs."nimboost".ref = "flake-pinning";
  inputs."nimboost".dir = "nimpkgs/n/nimboost";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimfp-v0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfp-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimfp-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}