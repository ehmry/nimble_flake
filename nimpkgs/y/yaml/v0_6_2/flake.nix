{
  description = ''YAML 1.2 implementation for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-yaml-v0_6_2.flake = false;
  inputs.src-yaml-v0_6_2.type = "github";
  inputs.src-yaml-v0_6_2.owner = "flyx";
  inputs.src-yaml-v0_6_2.repo = "NimYAML";
  inputs.src-yaml-v0_6_2.ref = "refs/tags/v0.6.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-yaml-v0_6_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-yaml-v0_6_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-yaml-v0_6_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}