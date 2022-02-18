{
  description = ''Nim interface for PRIMME: PReconditioned Iterative MultiMethod Eigensolver'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-primme-v3_0_0.flake = false;
  inputs.src-primme-v3_0_0.type = "github";
  inputs.src-primme-v3_0_0.owner = "jxy";
  inputs.src-primme-v3_0_0.repo = "primme";
  inputs.src-primme-v3_0_0.ref = "refs/tags/v3.0.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-primme-v3_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-primme-v3_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-primme-v3_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}