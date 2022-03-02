{
  description = ''Extensible data notation based on Cirru syntax'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-cirru_edn-v0_1_9.flake = false;
  inputs.src-cirru_edn-v0_1_9.type = "github";
  inputs.src-cirru_edn-v0_1_9.owner = "Cirru";
  inputs.src-cirru_edn-v0_1_9.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_1_9.ref = "refs/tags/v0.1.9";
  inputs.src-cirru_edn-v0_1_9.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-cirru_edn-v0_1_9, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_1_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cirru_edn-v0_1_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}