{
  description = ''Print fabulously in your terminal'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-fab-v0_4_0.flake = false;
  inputs.src-fab-v0_4_0.type = "github";
  inputs.src-fab-v0_4_0.owner = "icyphox";
  inputs.src-fab-v0_4_0.repo = "fab";
  inputs.src-fab-v0_4_0.ref = "refs/tags/v0.4.0";
  inputs.src-fab-v0_4_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-fab-v0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-fab-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-fab-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}