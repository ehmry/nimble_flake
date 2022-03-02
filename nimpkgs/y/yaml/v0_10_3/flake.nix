{
  description = ''YAML 1.2 implementation for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-yaml-v0_10_3.flake = false;
  inputs.src-yaml-v0_10_3.type = "github";
  inputs.src-yaml-v0_10_3.owner = "flyx";
  inputs.src-yaml-v0_10_3.repo = "NimYAML";
  inputs.src-yaml-v0_10_3.ref = "refs/tags/v0.10.3";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-yaml-v0_10_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-yaml-v0_10_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-yaml-v0_10_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}