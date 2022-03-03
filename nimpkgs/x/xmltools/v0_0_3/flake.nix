{
  description = ''High level xml library for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-xmltools-v0_0_3.flake = false;
  inputs.src-xmltools-v0_0_3.type = "github";
  inputs.src-xmltools-v0_0_3.owner = "vegansk";
  inputs.src-xmltools-v0_0_3.repo = "xmltools";
  inputs.src-xmltools-v0_0_3.ref = "refs/tags/v0.0.3";
  inputs.src-xmltools-v0_0_3.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."nimfp".type = "github";
  # inputs."nimfp".owner = "riinr";
  # inputs."nimfp".repo = "flake-nimble";
  # inputs."nimfp".ref = "flake-pinning";
  # inputs."nimfp".dir = "nimpkgs/n/nimfp";
  # inputs."nimfp".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."nimfp".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-xmltools-v0_0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-xmltools-v0_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-xmltools-v0_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}