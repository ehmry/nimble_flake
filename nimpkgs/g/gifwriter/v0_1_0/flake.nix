{
  description = ''Animated GIF writing library based on jo_gif'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-gifwriter-v0_1_0.flake = false;
  inputs.src-gifwriter-v0_1_0.type = "github";
  inputs.src-gifwriter-v0_1_0.owner = "rxi";
  inputs.src-gifwriter-v0_1_0.repo = "gifwriter";
  inputs.src-gifwriter-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gifwriter-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gifwriter-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gifwriter-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}