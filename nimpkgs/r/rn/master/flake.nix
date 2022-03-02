{
  description = ''minimal, performant mass file renamer'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-rn-master.flake = false;
  inputs.src-rn-master.type = "github";
  inputs.src-rn-master.owner = "xioren";
  inputs.src-rn-master.repo = "rn";
  inputs.src-rn-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-rn-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rn-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-rn-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}