{
  description = ''RIFF file handling for Nim '';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-riff-v0_2_0.flake = false;
  inputs.src-riff-v0_2_0.type = "github";
  inputs.src-riff-v0_2_0.owner = "johnnovak";
  inputs.src-riff-v0_2_0.repo = "nim-riff";
  inputs.src-riff-v0_2_0.ref = "refs/tags/v0.2.0";
  inputs.src-riff-v0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."binstreams".type = "github";
  # inputs."binstreams".owner = "riinr";
  # inputs."binstreams".repo = "flake-nimble";
  # inputs."binstreams".ref = "flake-pinning";
  # inputs."binstreams".dir = "nimpkgs/b/binstreams";
  # inputs."binstreams".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."binstreams".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-riff-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-riff-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-riff-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}