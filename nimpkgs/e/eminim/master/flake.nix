{
  description = ''JSON serialization framework'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-eminim-master.flake = false;
  inputs.src-eminim-master.type = "github";
  inputs.src-eminim-master.owner = "planetis-m";
  inputs.src-eminim-master.repo = "eminim";
  inputs.src-eminim-master.ref = "refs/heads/master";
  inputs.src-eminim-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-eminim-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-eminim-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-eminim-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}