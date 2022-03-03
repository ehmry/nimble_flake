{
  description = ''A QuickJS wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-quickjs4nim-master.flake = false;
  inputs.src-quickjs4nim-master.type = "github";
  inputs.src-quickjs4nim-master.owner = "ImVexed";
  inputs.src-quickjs4nim-master.repo = "quickjs4nim";
  inputs.src-quickjs4nim-master.ref = "refs/heads/master";
  inputs.src-quickjs4nim-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-QuickJS4nim-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-QuickJS4nim-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-QuickJS4nim-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}