{
  description = ''macro-based HTML templating engine'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-emerald-v0_1_0.flake = false;
  inputs.src-emerald-v0_1_0.type = "github";
  inputs.src-emerald-v0_1_0.owner = "flyx";
  inputs.src-emerald-v0_1_0.repo = "emerald";
  inputs.src-emerald-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-emerald-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-emerald-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-emerald-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}