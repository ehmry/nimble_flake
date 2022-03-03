{
  description = ''A Discord Bot & REST Library.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-dimscord-v1_0_6.flake = false;
  inputs.src-dimscord-v1_0_6.type = "github";
  inputs.src-dimscord-v1_0_6.owner = "krisppurg";
  inputs.src-dimscord-v1_0_6.repo = "dimscord";
  inputs.src-dimscord-v1_0_6.ref = "refs/tags/v1.0.6";
  inputs.src-dimscord-v1_0_6.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."zip".type = "github";
  # inputs."zip".owner = "riinr";
  # inputs."zip".repo = "flake-nimble";
  # inputs."zip".ref = "flake-pinning";
  # inputs."zip".dir = "nimpkgs/z/zip";
  # inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."ws".type = "github";
  # inputs."ws".owner = "riinr";
  # inputs."ws".repo = "flake-nimble";
  # inputs."ws".ref = "flake-pinning";
  # inputs."ws".dir = "nimpkgs/w/ws";
  # inputs."ws".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."ws".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."regex".type = "github";
  # inputs."regex".owner = "riinr";
  # inputs."regex".repo = "flake-nimble";
  # inputs."regex".ref = "flake-pinning";
  # inputs."regex".dir = "nimpkgs/r/regex";
  # inputs."regex".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."regex".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-dimscord-v1_0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dimscord-v1_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dimscord-v1_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}