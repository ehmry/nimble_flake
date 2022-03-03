{
  description = ''Transparently declare single-set attributes on types.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-finals-master.flake = false;
  inputs.src-finals-master.type = "github";
  inputs.src-finals-master.owner = "quelklef";
  inputs.src-finals-master.repo = "nim-finals";
  inputs.src-finals-master.ref = "refs/heads/master";
  inputs.src-finals-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-finals-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-finals-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-finals-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}