{
  description = ''nmi display animations aimed to correct users who accidentally enter nmi instead of nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nmi-v1_1_0.flake = false;
  inputs.src-nmi-v1_1_0.type = "github";
  inputs.src-nmi-v1_1_0.owner = "jiro4989";
  inputs.src-nmi-v1_1_0.repo = "nmi";
  inputs.src-nmi-v1_1_0.ref = "refs/tags/v1.1.0";
  inputs.src-nmi-v1_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nmi-v1_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nmi-v1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nmi-v1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}