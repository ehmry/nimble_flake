{
  description = ''Database schema migration library for Nim language.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-dbschema-v0_1_1.flake = false;
  inputs.src-dbschema-v0_1_1.type = "github";
  inputs.src-dbschema-v0_1_1.owner = "vegansk";
  inputs.src-dbschema-v0_1_1.repo = "dbschema";
  inputs.src-dbschema-v0_1_1.ref = "refs/tags/v0.1.1";
  inputs.src-dbschema-v0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."nimboost".type = "github";
  # inputs."nimboost".owner = "riinr";
  # inputs."nimboost".repo = "flake-nimble";
  # inputs."nimboost".ref = "flake-pinning";
  # inputs."nimboost".dir = "nimpkgs/n/nimboost";
  # inputs."nimboost".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."nimboost".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."nimfp".type = "github";
  # inputs."nimfp".owner = "riinr";
  # inputs."nimfp".repo = "flake-nimble";
  # inputs."nimfp".ref = "flake-pinning";
  # inputs."nimfp".dir = "nimpkgs/n/nimfp";
  # inputs."nimfp".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."nimfp".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-dbschema-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dbschema-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dbschema-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}