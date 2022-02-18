{
  description = ''Tools for working with re-frame ClojureScript projects'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-reframe-0_4_0.flake = false;
  inputs.src-reframe-0_4_0.type = "github";
  inputs.src-reframe-0_4_0.owner = "rosado";
  inputs.src-reframe-0_4_0.repo = "reframe.nim";
  inputs.src-reframe-0_4_0.ref = "refs/tags/0.4.0";
  
  
  inputs."edn".type = "github";
  inputs."edn".owner = "riinr";
  inputs."edn".repo = "flake-nimble";
  inputs."edn".ref = "flake-pinning";
  inputs."edn".dir = "nimpkgs/e/edn";

  outputs = { self, nixpkgs, flakeNimbleLib, src-reframe-0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-reframe-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-reframe-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}