{
  description = ''The Nim bindings for linksplatform/Data.Triplets.Kernel.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-triplets-0_0_7.flake = false;
  inputs.src-triplets-0_0_7.type = "github";
  inputs.src-triplets-0_0_7.owner = "linksplatform";
  inputs.src-triplets-0_0_7.repo = "Data.Triplets";
  inputs.src-triplets-0_0_7.ref = "refs/tags/0.0.7";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-triplets-0_0_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-triplets-0_0_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-triplets-0_0_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}