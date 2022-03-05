{
  description = ''Random curated Fonts and pastel Colors for your UI/UX design, design for non-designers.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."random_font_color-master".type = "github";
  inputs."random_font_color-master".owner = "riinr";
  inputs."random_font_color-master".repo = "flake-nimble";
  inputs."random_font_color-master".ref = "flake-pinning";
  inputs."random_font_color-master".dir = "nimpkgs/r/random_font_color/master";
  inputs."random_font_color-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."random_font_color-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}