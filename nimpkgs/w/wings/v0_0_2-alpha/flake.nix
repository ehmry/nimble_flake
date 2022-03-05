{
  description = ''A simple cross language struct and enum file generator.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-wings-v0_0_2-alpha.flake = false;
  inputs.src-wings-v0_0_2-alpha.type = "github";
  inputs.src-wings-v0_0_2-alpha.owner = "binhonglee";
  inputs.src-wings-v0_0_2-alpha.repo = "wings";
  inputs.src-wings-v0_0_2-alpha.ref = "refs/tags/v0.0.2-alpha";
  inputs.src-wings-v0_0_2-alpha.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-wings-v0_0_2-alpha, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-wings-v0_0_2-alpha;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-wings-v0_0_2-alpha"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}