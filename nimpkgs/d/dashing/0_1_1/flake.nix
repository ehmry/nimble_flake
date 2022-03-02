{
  description = ''Terminal dashboards.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-dashing-0_1_1.flake = false;
  inputs.src-dashing-0_1_1.type = "github";
  inputs.src-dashing-0_1_1.owner = "FedericoCeratto";
  inputs.src-dashing-0_1_1.repo = "nim-dashing";
  inputs.src-dashing-0_1_1.ref = "refs/tags/0.1.1";
  inputs.src-dashing-0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-dashing-0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dashing-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dashing-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}