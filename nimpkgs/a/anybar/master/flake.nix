{
  description = ''Control AnyBar instances with Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-Anybar-master.flake = false;
  inputs.src-Anybar-master.type = "github";
  inputs.src-Anybar-master.owner = "ba0f3";
  inputs.src-Anybar-master.repo = "anybar.nim";
  inputs.src-Anybar-master.ref = "refs/heads/master";
  inputs.src-Anybar-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-anybar-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-anybar-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-anybar-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}