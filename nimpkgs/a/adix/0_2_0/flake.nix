{
  description = ''An Adaptive Index Library For Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-adix-0_2_0.flake = false;
  inputs.src-adix-0_2_0.type = "github";
  inputs.src-adix-0_2_0.owner = "c-blake";
  inputs.src-adix-0_2_0.repo = "adix";
  inputs.src-adix-0_2_0.ref = "refs/tags/0.2.0";
  inputs.src-adix-0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-adix-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-adix-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-adix-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}