{
  description = ''The Nim bindings for linksplatform/Data.Triplets.Kernel.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-triplets-0_0_3.flake = false;
  inputs.src-triplets-0_0_3.type = "github";
  inputs.src-triplets-0_0_3.owner = "linksplatform";
  inputs.src-triplets-0_0_3.repo = "Data.Triplets";
  inputs.src-triplets-0_0_3.ref = "refs/tags/0.0.3";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-triplets-0_0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-triplets-0_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-triplets-0_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}