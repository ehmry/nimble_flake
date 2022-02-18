{
  description = ''Too awesome procs to be included in nimrod.os module'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-genieos-v9_0_1-jessica.flake = false;
  inputs.src-genieos-v9_0_1-jessica.type = "github";
  inputs.src-genieos-v9_0_1-jessica.owner = "Araq";
  inputs.src-genieos-v9_0_1-jessica.repo = "genieos";
  inputs.src-genieos-v9_0_1-jessica.ref = "refs/tags/v9.0.1-jessica";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-genieos-v9_0_1-jessica, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-genieos-v9_0_1-jessica;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-genieos-v9_0_1-jessica"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}