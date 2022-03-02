{
  description = ''Matrix library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-manu-v1_5.flake = false;
  inputs.src-manu-v1_5.type = "github";
  inputs.src-manu-v1_5.owner = "planetis-m";
  inputs.src-manu-v1_5.repo = "manu";
  inputs.src-manu-v1_5.ref = "refs/tags/v1.5";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-manu-v1_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-manu-v1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-manu-v1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}