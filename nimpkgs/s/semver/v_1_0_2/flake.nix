{
  description = ''Semantic versioning parser for Nim. Allows the parsing of version strings into objects and the comparing of version objects.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-semver-v_1_0_2.flake = false;
  inputs.src-semver-v_1_0_2.type = "github";
  inputs.src-semver-v_1_0_2.owner = "euantorano";
  inputs.src-semver-v_1_0_2.repo = "semver.nim";
  inputs.src-semver-v_1_0_2.ref = "refs/tags/v.1.0.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-semver-v_1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-semver-v_1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-semver-v_1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}