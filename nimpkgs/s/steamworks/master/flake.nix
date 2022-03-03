{
  description = ''Steamworks SDK API for shipping games on Steam.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-steamworks-master.flake = false;
  inputs.src-steamworks-master.type = "github";
  inputs.src-steamworks-master.owner = "treeform";
  inputs.src-steamworks-master.repo = "steamworks";
  inputs.src-steamworks-master.ref = "refs/heads/master";
  inputs.src-steamworks-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-steamworks-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-steamworks-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-steamworks-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}