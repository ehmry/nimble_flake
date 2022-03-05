{
  description = ''A pattern matching library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-gara-master.flake = false;
  inputs.src-gara-master.type = "github";
  inputs.src-gara-master.owner = "alehander42";
  inputs.src-gara-master.repo = "gara";
  inputs.src-gara-master.ref = "refs/heads/master";
  inputs.src-gara-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gara-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gara-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gara-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}