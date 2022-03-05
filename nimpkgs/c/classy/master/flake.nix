{
  description = ''typeclasses for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-classy-master.flake = false;
  inputs.src-classy-master.type = "github";
  inputs.src-classy-master.owner = "nigredo-tori";
  inputs.src-classy-master.repo = "classy";
  inputs.src-classy-master.ref = "refs/heads/master";
  inputs.src-classy-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-classy-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-classy-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-classy-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}