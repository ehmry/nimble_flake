{
  description = ''AWS Security Token Service API in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-awsSTS-v1_0_0.flake = false;
  inputs.src-awsSTS-v1_0_0.type = "github";
  inputs.src-awsSTS-v1_0_0.owner = "ThomasTJdev";
  inputs.src-awsSTS-v1_0_0.repo = "nim_awsSTS";
  inputs.src-awsSTS-v1_0_0.ref = "refs/tags/v1.0.0";
  inputs.src-awsSTS-v1_0_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."sigv4".type = "github";
  # inputs."sigv4".owner = "riinr";
  # inputs."sigv4".repo = "flake-nimble";
  # inputs."sigv4".ref = "flake-pinning";
  # inputs."sigv4".dir = "nimpkgs/s/sigv4";
  # inputs."sigv4".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."sigv4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-awsSTS-v1_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-awsSTS-v1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-awsSTS-v1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}