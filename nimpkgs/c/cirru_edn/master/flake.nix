{
  description = ''Extensible data notation based on Cirru syntax'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-cirru_edn-master.flake = false;
  inputs.src-cirru_edn-master.type = "github";
  inputs.src-cirru_edn-master.owner = "Cirru";
  inputs.src-cirru_edn-master.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-master.ref = "refs/heads/master";
  inputs.src-cirru_edn-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."cirru_parser".type = "github";
  # inputs."cirru_parser".owner = "riinr";
  # inputs."cirru_parser".repo = "flake-nimble";
  # inputs."cirru_parser".ref = "flake-pinning";
  # inputs."cirru_parser".dir = "nimpkgs/c/cirru_parser";
  # inputs."cirru_parser".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cirru_parser".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."cirru_writer".type = "github";
  # inputs."cirru_writer".owner = "riinr";
  # inputs."cirru_writer".repo = "flake-nimble";
  # inputs."cirru_writer".ref = "flake-pinning";
  # inputs."cirru_writer".dir = "nimpkgs/c/cirru_writer";
  # inputs."cirru_writer".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cirru_writer".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-cirru_edn-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cirru_edn-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}