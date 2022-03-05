{
  description = ''A 3d sound API for nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-slappy-master.flake = false;
  inputs.src-slappy-master.type = "github";
  inputs.src-slappy-master.owner = "treeform";
  inputs.src-slappy-master.repo = "slappy";
  inputs.src-slappy-master.ref = "refs/heads/master";
  inputs.src-slappy-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."openal".type = "github";
  inputs."openal".owner = "riinr";
  inputs."openal".repo = "flake-nimble";
  inputs."openal".ref = "flake-pinning";
  inputs."openal".dir = "nimpkgs/o/openal";
  inputs."openal".inputs.nixpkgs.follows = "nixpkgs";
  inputs."openal".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."vmath".type = "github";
  inputs."vmath".owner = "riinr";
  inputs."vmath".repo = "flake-nimble";
  inputs."vmath".ref = "flake-pinning";
  inputs."vmath".dir = "nimpkgs/v/vmath";
  inputs."vmath".inputs.nixpkgs.follows = "nixpkgs";
  inputs."vmath".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."supersnappy".type = "github";
  inputs."supersnappy".owner = "riinr";
  inputs."supersnappy".repo = "flake-nimble";
  inputs."supersnappy".ref = "flake-pinning";
  inputs."supersnappy".dir = "nimpkgs/s/supersnappy";
  inputs."supersnappy".inputs.nixpkgs.follows = "nixpkgs";
  inputs."supersnappy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-slappy-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-slappy-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-slappy-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}