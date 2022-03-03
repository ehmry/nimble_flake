{
  description = ''Matrix library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-manu-v1_0.flake = false;
  inputs.src-manu-v1_0.type = "github";
  inputs.src-manu-v1_0.owner = "planetis-m";
  inputs.src-manu-v1_0.repo = "manu";
  inputs.src-manu-v1_0.ref = "refs/tags/v1.0";
  inputs.src-manu-v1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-manu-v1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-manu-v1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-manu-v1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}