{
  description = ''A tiny static file web server.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-srv-master.flake = false;
  inputs.src-srv-master.type = "github";
  inputs.src-srv-master.owner = "me7";
  inputs.src-srv-master.repo = "srv";
  inputs.src-srv-master.ref = "refs/heads/master";
  inputs.src-srv-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-srv-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-srv-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-srv-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}