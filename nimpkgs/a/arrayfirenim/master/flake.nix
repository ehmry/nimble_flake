{
  description = ''A nim wrapper for ArrayFire'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-ArrayFireNim-master.flake = false;
  inputs.src-ArrayFireNim-master.type = "github";
  inputs.src-ArrayFireNim-master.owner = "bitstormGER";
  inputs.src-ArrayFireNim-master.repo = "ArrayFire-Nim";
  inputs.src-ArrayFireNim-master.ref = "refs/heads/master";
  inputs.src-ArrayFireNim-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-ArrayFireNim-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ArrayFireNim-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ArrayFireNim-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}