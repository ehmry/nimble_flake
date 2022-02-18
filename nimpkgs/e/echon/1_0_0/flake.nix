{
  description = ''A small package to create lindenmayer-systems or l-systems.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-echon-1_0_0.flake = false;
  inputs.src-echon-1_0_0.type = "github";
  inputs.src-echon-1_0_0.owner = "eXodiquas";
  inputs.src-echon-1_0_0.repo = "Echon";
  inputs.src-echon-1_0_0.ref = "refs/tags/1.0.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-echon-1_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-echon-1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-echon-1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}