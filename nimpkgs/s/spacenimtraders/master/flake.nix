{
  description = ''A new awesome nimble package'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-spacenimtraders-master.flake = false;
  inputs.src-spacenimtraders-master.type = "github";
  inputs.src-spacenimtraders-master.owner = "ire4ever1190";
  inputs.src-spacenimtraders-master.repo = "SpaceNimTraders";
  inputs.src-spacenimtraders-master.ref = "refs/heads/master";
  inputs.src-spacenimtraders-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-spacenimtraders-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-spacenimtraders-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-spacenimtraders-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}