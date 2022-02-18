{
  description = ''Semantic versioning parser for Nim. Allows the parsing of version strings into objects and the comparing of version objects.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-semver-v1_0_1.flake = false;
  inputs.src-semver-v1_0_1.type = "github";
  inputs.src-semver-v1_0_1.owner = "euantorano";
  inputs.src-semver-v1_0_1.repo = "semver.nim";
  inputs.src-semver-v1_0_1.ref = "refs/tags/v1.0.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-semver-v1_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-semver-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-semver-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}