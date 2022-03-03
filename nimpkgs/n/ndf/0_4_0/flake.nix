{
  description = ''Duplicate files finder'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-ndf-0_4_0.flake = false;
  inputs.src-ndf-0_4_0.type = "github";
  inputs.src-ndf-0_4_0.owner = "rustomax";
  inputs.src-ndf-0_4_0.repo = "ndf";
  inputs.src-ndf-0_4_0.ref = "refs/tags/0.4.0";
  inputs.src-ndf-0_4_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."docopt".type = "github";
  # inputs."docopt".owner = "riinr";
  # inputs."docopt".repo = "flake-nimble";
  # inputs."docopt".ref = "flake-pinning";
  # inputs."docopt".dir = "nimpkgs/d/docopt";
  # inputs."docopt".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."docopt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."murmurhash".type = "github";
  # inputs."murmurhash".owner = "riinr";
  # inputs."murmurhash".repo = "flake-nimble";
  # inputs."murmurhash".ref = "flake-pinning";
  # inputs."murmurhash".dir = "nimpkgs/m/murmurhash";
  # inputs."murmurhash".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."murmurhash".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-ndf-0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ndf-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ndf-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}