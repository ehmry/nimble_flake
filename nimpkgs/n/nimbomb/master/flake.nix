{
  description = ''A GiantBomb-wiki wrapper for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimbomb-master.flake = false;
  inputs.src-nimbomb-master.type = "github";
  inputs.src-nimbomb-master.owner = "tyler-Yocolano";
  inputs.src-nimbomb-master.repo = "nimbomb";
  inputs.src-nimbomb-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimbomb-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimbomb-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimbomb-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}