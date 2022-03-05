{
  description = ''Open Source Routing Machine for OpenStreetMap API Lib and App'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-osrm-0_1_5.flake = false;
  inputs.src-osrm-0_1_5.type = "github";
  inputs.src-osrm-0_1_5.owner = "juancarlospaco";
  inputs.src-osrm-0_1_5.repo = "nim-osrm";
  inputs.src-osrm-0_1_5.ref = "refs/tags/0.1.5";
  inputs.src-osrm-0_1_5.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-osrm-0_1_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-osrm-0_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-osrm-0_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}