{
  description = ''Fuzzy search wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimfuzzy-v0_1_0.flake = false;
  inputs.src-nimfuzzy-v0_1_0.type = "github";
  inputs.src-nimfuzzy-v0_1_0.owner = "genotrance";
  inputs.src-nimfuzzy-v0_1_0.repo = "nimfuzzy";
  inputs.src-nimfuzzy-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimfuzzy-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfuzzy-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimfuzzy-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}