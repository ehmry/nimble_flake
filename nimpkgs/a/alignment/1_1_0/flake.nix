{
  description = ''alignment is a library to align strings.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-alignment-1_1_0.flake = false;
  inputs.src-alignment-1_1_0.type = "github";
  inputs.src-alignment-1_1_0.owner = "jiro4989";
  inputs.src-alignment-1_1_0.repo = "alignment";
  inputs.src-alignment-1_1_0.ref = "refs/tags/1.1.0";
  inputs.src-alignment-1_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."eastasianwidth".type = "github";
  # inputs."eastasianwidth".owner = "riinr";
  # inputs."eastasianwidth".repo = "flake-nimble";
  # inputs."eastasianwidth".ref = "flake-pinning";
  # inputs."eastasianwidth".dir = "nimpkgs/e/eastasianwidth";
  # inputs."eastasianwidth".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."eastasianwidth".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-alignment-1_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-alignment-1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-alignment-1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}