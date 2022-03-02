{
  description = ''A RPC framework for building web APIs'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nerve-0_3_0.flake = false;
  inputs.src-nerve-0_3_0.type = "github";
  inputs.src-nerve-0_3_0.owner = "nepeckman";
  inputs.src-nerve-0_3_0.repo = "nerve-rpc";
  inputs.src-nerve-0_3_0.ref = "refs/tags/0.3.0";
  
  
  inputs."ws".type = "github";
  inputs."ws".owner = "riinr";
  inputs."ws".repo = "flake-nimble";
  inputs."ws".ref = "flake-pinning";
  inputs."ws".dir = "nimpkgs/w/ws";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nerve-0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nerve-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nerve-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}