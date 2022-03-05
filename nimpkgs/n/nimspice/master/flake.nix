{
  description = ''A bunch of macros. sugar if you would'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimspice-master.flake = false;
  inputs.src-nimspice-master.type = "github";
  inputs.src-nimspice-master.owner = "CodeDoes";
  inputs.src-nimspice-master.repo = "nimspice";
  inputs.src-nimspice-master.ref = "refs/heads/master";
  inputs.src-nimspice-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimspice-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimspice-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimspice-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}