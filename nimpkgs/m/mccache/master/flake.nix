{
  description = ''mccache package: in-memory caching'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mccache-master.flake = false;
  inputs.src-mccache-master.type = "github";
  inputs.src-mccache-master.owner = "abbeymart";
  inputs.src-mccache-master.repo = "mccache-nim";
  inputs.src-mccache-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-mccache-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mccache-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mccache-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}