{
  description = ''Create memorable sentences from byte sequences.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mnemonic-v0_1_2.flake = false;
  inputs.src-mnemonic-v0_1_2.type = "github";
  inputs.src-mnemonic-v0_1_2.owner = "markspanbroek";
  inputs.src-mnemonic-v0_1_2.repo = "mnemonic";
  inputs.src-mnemonic-v0_1_2.ref = "refs/tags/v0.1.2";
  
  
  inputs."nimsha2".type = "github";
  inputs."nimsha2".owner = "riinr";
  inputs."nimsha2".repo = "flake-nimble";
  inputs."nimsha2".ref = "flake-pinning";
  inputs."nimsha2".dir = "nimpkgs/n/nimsha2";

  outputs = { self, nixpkgs, flakeNimbleLib, src-mnemonic-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mnemonic-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mnemonic-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}