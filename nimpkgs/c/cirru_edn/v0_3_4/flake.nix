{
  description = ''Extensible data notation based on Cirru syntax'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-cirru_edn-v0_3_4.flake = false;
  inputs.src-cirru_edn-v0_3_4.type = "github";
  inputs.src-cirru_edn-v0_3_4.owner = "Cirru";
  inputs.src-cirru_edn-v0_3_4.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_3_4.ref = "refs/tags/v0.3.4";
  inputs.src-cirru_edn-v0_3_4.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."cirru_parser".type = "github";
  inputs."cirru_parser".owner = "riinr";
  inputs."cirru_parser".repo = "flake-nimble";
  inputs."cirru_parser".ref = "flake-pinning";
  inputs."cirru_parser".dir = "nimpkgs/c/cirru_parser";
  inputs."cirru_parser".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cirru_parser".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-cirru_edn-v0_3_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_3_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cirru_edn-v0_3_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}