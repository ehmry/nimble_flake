{
  description = ''A Nim source only UUID generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nuuid-master.flake = false;
  inputs.src-nuuid-master.type = "github";
  inputs.src-nuuid-master.owner = "yglukhov";
  inputs.src-nuuid-master.repo = "nim-only-uuid";
  inputs.src-nuuid-master.ref = "refs/heads/master";
  inputs.src-nuuid-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nuuid-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nuuid-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nuuid-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}