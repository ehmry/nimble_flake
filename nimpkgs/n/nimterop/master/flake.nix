{
  description = ''Nimterop makes C/C++ interop within Nim seamless'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimterop-master.flake = false;
  inputs.src-nimterop-master.type = "github";
  inputs.src-nimterop-master.owner = "genotrance";
  inputs.src-nimterop-master.repo = "nimterop";
  inputs.src-nimterop-master.ref = "refs/heads/master";
  inputs.src-nimterop-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimterop-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimterop-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimterop-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}