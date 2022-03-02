{
  description = ''JSON serialization framework'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-eminim-v1_7_0.flake = false;
  inputs.src-eminim-v1_7_0.type = "github";
  inputs.src-eminim-v1_7_0.owner = "planetis-m";
  inputs.src-eminim-v1_7_0.repo = "eminim";
  inputs.src-eminim-v1_7_0.ref = "refs/tags/v1.7.0";
  inputs.src-eminim-v1_7_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-eminim-v1_7_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-eminim-v1_7_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-eminim-v1_7_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}