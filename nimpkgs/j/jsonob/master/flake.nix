{
  description = ''JSON / Object mapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-jsonob-master.flake = false;
  inputs.src-jsonob-master.type = "github";
  inputs.src-jsonob-master.owner = "cjxgm";
  inputs.src-jsonob-master.repo = "jsonob";
  inputs.src-jsonob-master.ref = "refs/heads/master";
  inputs.src-jsonob-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-jsonob-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jsonob-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jsonob-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}