{
  description = ''A wrapper to Tesseract OCR library for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimtesseract-v0_2_0.flake = false;
  inputs.src-nimtesseract-v0_2_0.type = "github";
  inputs.src-nimtesseract-v0_2_0.owner = "DavideGalilei";
  inputs.src-nimtesseract-v0_2_0.repo = "nimtesseract";
  inputs.src-nimtesseract-v0_2_0.ref = "refs/tags/v0.2.0";
  
  
  inputs."pixie".type = "github";
  inputs."pixie".owner = "riinr";
  inputs."pixie".repo = "flake-nimble";
  inputs."pixie".ref = "flake-pinning";
  inputs."pixie".dir = "nimpkgs/p/pixie";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimtesseract-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimtesseract-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimtesseract-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}