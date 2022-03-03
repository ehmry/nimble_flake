{
  description = ''curl statistics made simple '';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-httpstat-v0_1_1.flake = false;
  inputs.src-httpstat-v0_1_1.type = "github";
  inputs.src-httpstat-v0_1_1.owner = "ucpr";
  inputs.src-httpstat-v0_1_1.repo = "httpstat";
  inputs.src-httpstat-v0_1_1.ref = "refs/tags/v0.1.1";
  inputs.src-httpstat-v0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-httpstat-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-httpstat-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-httpstat-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}