{
  description = ''Unicode text segmentation tr29'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-segmentation-v0_0_1.flake = false;
  inputs.src-segmentation-v0_0_1.type = "github";
  inputs.src-segmentation-v0_0_1.owner = "nitely";
  inputs.src-segmentation-v0_0_1.repo = "nim-segmentation";
  inputs.src-segmentation-v0_0_1.ref = "refs/tags/v0.0.1";
  
  
  inputs."unicodedb".type = "github";
  inputs."unicodedb".owner = "riinr";
  inputs."unicodedb".repo = "flake-nimble";
  inputs."unicodedb".ref = "flake-pinning";
  inputs."unicodedb".dir = "nimpkgs/u/unicodedb";

  outputs = { self, nixpkgs, flakeNimbleLib, src-segmentation-v0_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-segmentation-v0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-segmentation-v0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}