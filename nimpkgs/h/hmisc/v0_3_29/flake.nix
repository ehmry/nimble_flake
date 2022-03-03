{
  description = ''Collection of helper utilities'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-hmisc-v0_3_29.flake = false;
  inputs.src-hmisc-v0_3_29.type = "github";
  inputs.src-hmisc-v0_3_29.owner = "haxscramper";
  inputs.src-hmisc-v0_3_29.repo = "hmisc";
  inputs.src-hmisc-v0_3_29.ref = "refs/tags/v0.3.29";
  inputs.src-hmisc-v0_3_29.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."with".type = "github";
  # inputs."with".owner = "riinr";
  # inputs."with".repo = "flake-nimble";
  # inputs."with".ref = "flake-pinning";
  # inputs."with".dir = "nimpkgs/w/with";
  # inputs."with".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."with".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."shell".type = "github";
  # inputs."shell".owner = "riinr";
  # inputs."shell".repo = "flake-nimble";
  # inputs."shell".ref = "flake-pinning";
  # inputs."shell".dir = "nimpkgs/s/shell";
  # inputs."shell".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."shell".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."macroutils".type = "github";
  # inputs."macroutils".owner = "riinr";
  # inputs."macroutils".repo = "flake-nimble";
  # inputs."macroutils".ref = "flake-pinning";
  # inputs."macroutils".dir = "nimpkgs/m/macroutils";
  # inputs."macroutils".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."macroutils".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-hmisc-v0_3_29, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hmisc-v0_3_29;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-hmisc-v0_3_29"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}