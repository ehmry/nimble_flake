{
  description = ''A low level GPIO library for the BeagleBone board family'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-boneIO-master.flake = false;
  inputs.src-boneIO-master.type = "github";
  inputs.src-boneIO-master.owner = "xyz32";
  inputs.src-boneIO-master.repo = "boneIO";
  inputs.src-boneIO-master.ref = "refs/heads/master";
  inputs.src-boneIO-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-boneIO-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-boneIO-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-boneIO-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}