{
  description = ''Porting some Python / Kotlin features to Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-pykot-master.flake = false;
  inputs.src-pykot-master.type = "github";
  inputs.src-pykot-master.owner = "jabbalaci";
  inputs.src-pykot-master.repo = "nimpykot";
  inputs.src-pykot-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-pykot-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pykot-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pykot-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}