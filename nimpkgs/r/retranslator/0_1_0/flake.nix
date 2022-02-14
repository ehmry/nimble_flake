{
  description = ''Transformer'';
  inputs.src-retranslator-0_1_0.flake = false;
  inputs.src-retranslator-0_1_0.type = "github";
  inputs.src-retranslator-0_1_0.owner = "linksplatform";
  inputs.src-retranslator-0_1_0.repo = "RegularExpressions.Transformer";
  inputs.src-retranslator-0_1_0.ref = "refs/tags/0.1.0";
  
  
  inputs."nre".url = "path:../../../n/nre";
  inputs."nre".type = "github";
  inputs."nre".owner = "riinr";
  inputs."nre".repo = "flake-nimble";
  inputs."nre".ref = "flake-pinning";
  inputs."nre".dir = "nimpkgs/n/nre";

  outputs = { self, nixpkgs, src-retranslator-0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-retranslator-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-retranslator-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}