{
  description = ''A new awesome nimble package'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-tim_sort-master.flake = false;
  inputs.src-tim_sort-master.type = "github";
  inputs.src-tim_sort-master.owner = "bung87";
  inputs.src-tim_sort-master.repo = "tim_sort";
  inputs.src-tim_sort-master.ref = "refs/heads/master";
  inputs.src-tim_sort-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-tim_sort-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tim_sort-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-tim_sort-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}