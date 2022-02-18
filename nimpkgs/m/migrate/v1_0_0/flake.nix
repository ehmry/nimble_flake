{
  description = ''A simple database migration utility for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-migrate-v1_0_0.flake = false;
  inputs.src-migrate-v1_0_0.type = "github";
  inputs.src-migrate-v1_0_0.owner = "euantorano";
  inputs.src-migrate-v1_0_0.repo = "migrate.nim";
  inputs.src-migrate-v1_0_0.ref = "refs/tags/v1.0.0";
  
  
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";

  outputs = { self, nixpkgs, flakeNimbleLib, src-migrate-v1_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-migrate-v1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-migrate-v1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}