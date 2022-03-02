{
  description = ''C2nim helper to simplify and automate wrapping C libraries'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimgen-v0_1_2.flake = false;
  inputs.src-nimgen-v0_1_2.type = "github";
  inputs.src-nimgen-v0_1_2.owner = "genotrance";
  inputs.src-nimgen-v0_1_2.repo = "nimgen";
  inputs.src-nimgen-v0_1_2.ref = "refs/tags/v0.1.2";
  
  
  inputs."c2nim".type = "github";
  inputs."c2nim".owner = "riinr";
  inputs."c2nim".repo = "flake-nimble";
  inputs."c2nim".ref = "flake-pinning";
  inputs."c2nim".dir = "nimpkgs/c/c2nim";

  
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimgen-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimgen-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimgen-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}