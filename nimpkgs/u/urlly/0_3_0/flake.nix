{
  description = ''URL and URI parsing for C and JS backend.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-urlly-0_3_0.flake = false;
  inputs.src-urlly-0_3_0.type = "github";
  inputs.src-urlly-0_3_0.owner = "treeform";
  inputs.src-urlly-0_3_0.repo = "urlly";
  inputs.src-urlly-0_3_0.ref = "refs/tags/0.3.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-urlly-0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-urlly-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-urlly-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}