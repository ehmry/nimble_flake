{
  description = ''declarative UI framework for building Canvas'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-Blackvas-master.flake = false;
  inputs.src-Blackvas-master.type = "github";
  inputs.src-Blackvas-master.owner = "momeemt";
  inputs.src-Blackvas-master.repo = "Blackvas";
  inputs.src-Blackvas-master.ref = "refs/heads/master";
  inputs.src-Blackvas-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-Blackvas-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-Blackvas-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-Blackvas-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}