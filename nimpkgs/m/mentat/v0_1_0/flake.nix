{
  description = ''A Nim library for data science and machine learning'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mentat-v0_1_0.flake = false;
  inputs.src-mentat-v0_1_0.type = "github";
  inputs.src-mentat-v0_1_0.owner = "ruivieira";
  inputs.src-mentat-v0_1_0.repo = "nim-mentat";
  inputs.src-mentat-v0_1_0.ref = "refs/tags/v0.1.0";
  
  
  inputs."science".type = "github";
  inputs."science".owner = "riinr";
  inputs."science".repo = "flake-nimble";
  inputs."science".ref = "flake-pinning";
  inputs."science".dir = "nimpkgs/s/science";

  outputs = { self, nixpkgs, flakeNimbleLib, src-mentat-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mentat-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mentat-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}