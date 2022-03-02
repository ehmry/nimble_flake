{
  description = ''Converts a file with Jester routes to Swagger JSON which can be imported in Postman.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."jester2swagger-main".type = "github";
  inputs."jester2swagger-main".owner = "riinr";
  inputs."jester2swagger-main".repo = "flake-nimble";
  inputs."jester2swagger-main".ref = "flake-pinning";
  inputs."jester2swagger-main".dir = "nimpkgs/j/jester2swagger/main";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}