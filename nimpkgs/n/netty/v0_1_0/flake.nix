{
  description = ''Netty is a reliable UDP connection for games.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-netty-v0_1_0.flake = false;
  inputs.src-netty-v0_1_0.type = "github";
  inputs.src-netty-v0_1_0.owner = "treeform";
  inputs.src-netty-v0_1_0.repo = "netty";
  inputs.src-netty-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-netty-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-netty-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-netty-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}