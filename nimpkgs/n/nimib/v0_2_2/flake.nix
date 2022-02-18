{
  description = ''nimib 🐳 - nim 👑 driven ⛵ publishing ✍'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimib-v0_2_2.flake = false;
  inputs.src-nimib-v0_2_2.type = "github";
  inputs.src-nimib-v0_2_2.owner = "pietroppeter";
  inputs.src-nimib-v0_2_2.repo = "nimib";
  inputs.src-nimib-v0_2_2.ref = "refs/tags/v0.2.2";
  
  
  inputs."tempfile".type = "github";
  inputs."tempfile".owner = "riinr";
  inputs."tempfile".repo = "flake-nimble";
  inputs."tempfile".ref = "flake-pinning";
  inputs."tempfile".dir = "nimpkgs/t/tempfile";

  
  inputs."markdown".type = "github";
  inputs."markdown".owner = "riinr";
  inputs."markdown".repo = "flake-nimble";
  inputs."markdown".ref = "flake-pinning";
  inputs."markdown".dir = "nimpkgs/m/markdown";

  
  inputs."mustache".type = "github";
  inputs."mustache".owner = "riinr";
  inputs."mustache".repo = "flake-nimble";
  inputs."mustache".ref = "flake-pinning";
  inputs."mustache".dir = "nimpkgs/m/mustache";

  
  inputs."toml_serialization".type = "github";
  inputs."toml_serialization".owner = "riinr";
  inputs."toml_serialization".repo = "flake-nimble";
  inputs."toml_serialization".ref = "flake-pinning";
  inputs."toml_serialization".dir = "nimpkgs/t/toml_serialization";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimib-v0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimib-v0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimib-v0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}