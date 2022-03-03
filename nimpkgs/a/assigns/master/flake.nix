{
  description = ''syntax sugar for assignments'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-assigns-master.flake = false;
  inputs.src-assigns-master.type = "github";
  inputs.src-assigns-master.owner = "metagn";
  inputs.src-assigns-master.repo = "assigns";
  inputs.src-assigns-master.ref = "refs/heads/master";
  inputs.src-assigns-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-assigns-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-assigns-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-assigns-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}