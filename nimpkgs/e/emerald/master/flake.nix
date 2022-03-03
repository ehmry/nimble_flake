{
  description = ''macro-based HTML templating engine'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-emerald-master.flake = false;
  inputs.src-emerald-master.type = "github";
  inputs.src-emerald-master.owner = "flyx";
  inputs.src-emerald-master.repo = "emerald";
  inputs.src-emerald-master.ref = "refs/heads/master";
  inputs.src-emerald-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-emerald-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-emerald-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-emerald-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}