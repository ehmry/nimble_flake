{
  description = ''A nimrod wrapper for libalpm'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimalpm-master.flake = false;
  inputs.src-nimalpm-master.type = "github";
  inputs.src-nimalpm-master.owner = "barcharcraz";
  inputs.src-nimalpm-master.repo = "nimalpm";
  inputs.src-nimalpm-master.ref = "refs/heads/master";
  inputs.src-nimalpm-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimalpm-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimalpm-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimalpm-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}