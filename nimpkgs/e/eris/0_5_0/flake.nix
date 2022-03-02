{
  description = ''Encoding for Robust Immutable Storage (ERIS)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-eris-0_5_0.flake = false;
  inputs.src-eris-0_5_0.type = "other";
  inputs.src-eris-0_5_0.owner = "~ehmry";
  inputs.src-eris-0_5_0.repo = "eris";
  inputs.src-eris-0_5_0.ref = "refs/tags/0.5.0";
  inputs.src-eris-0_5_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."base32".type = "github";
  # inputs."base32".owner = "riinr";
  # inputs."base32".repo = "flake-nimble";
  # inputs."base32".ref = "flake-pinning";
  # inputs."base32".dir = "nimpkgs/b/base32";
  # inputs."base32".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."base32".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."taps".type = "github";
  # inputs."taps".owner = "riinr";
  # inputs."taps".repo = "flake-nimble";
  # inputs."taps".ref = "flake-pinning";
  # inputs."taps".dir = "nimpkgs/t/taps";
  # inputs."taps".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."taps".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."tkrzw".type = "github";
  # inputs."tkrzw".owner = "riinr";
  # inputs."tkrzw".repo = "flake-nimble";
  # inputs."tkrzw".ref = "flake-pinning";
  # inputs."tkrzw".dir = "nimpkgs/t/tkrzw";
  # inputs."tkrzw".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."tkrzw".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-eris-0_5_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-eris-0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-eris-0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}