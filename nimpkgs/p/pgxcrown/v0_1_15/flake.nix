{
  description = ''Build Postgres extensions in Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pgxcrown-v0_1_15.flake = false;
  inputs.src-pgxcrown-v0_1_15.type = "github";
  inputs.src-pgxcrown-v0_1_15.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_15.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_15.ref = "refs/tags/v0.1.15";
  inputs.src-pgxcrown-v0_1_15.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-pgxcrown-v0_1_15, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_15;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pgxcrown-v0_1_15"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}