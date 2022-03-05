{
  description = ''Fuzzy search wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimfuzzy-v0_1_5.flake = false;
  inputs.src-nimfuzzy-v0_1_5.type = "github";
  inputs.src-nimfuzzy-v0_1_5.owner = "genotrance";
  inputs.src-nimfuzzy-v0_1_5.repo = "nimfuzzy";
  inputs.src-nimfuzzy-v0_1_5.ref = "refs/tags/v0.1.5";
  inputs.src-nimfuzzy-v0_1_5.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimgen".type = "github";
  inputs."nimgen".owner = "riinr";
  inputs."nimgen".repo = "flake-nimble";
  inputs."nimgen".ref = "flake-pinning";
  inputs."nimgen".dir = "nimpkgs/n/nimgen";
  inputs."nimgen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimgen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimfuzzy-v0_1_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfuzzy-v0_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimfuzzy-v0_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}