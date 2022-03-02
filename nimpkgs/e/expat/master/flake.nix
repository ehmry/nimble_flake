{
  description = ''Expat wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-expat-master.flake = false;
  inputs.src-expat-master.type = "github";
  inputs.src-expat-master.owner = "nim-lang";
  inputs.src-expat-master.repo = "expat";
  inputs.src-expat-master.ref = "refs/heads/master";
  inputs.src-expat-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-expat-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-expat-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-expat-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}