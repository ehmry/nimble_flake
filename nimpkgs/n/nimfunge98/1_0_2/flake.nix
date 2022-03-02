{
  description = ''A Funge-98 interpreter written in nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimfunge98-1_0_2.flake = false;
  inputs.src-nimfunge98-1_0_2.type = "other";
  inputs.src-nimfunge98-1_0_2.owner = "adyxax";
  inputs.src-nimfunge98-1_0_2.repo = "nimfunge98";
  inputs.src-nimfunge98-1_0_2.ref = "refs/tags/1.0.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimfunge98-1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfunge98-1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimfunge98-1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}