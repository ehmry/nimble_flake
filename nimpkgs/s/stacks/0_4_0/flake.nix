{
  description = ''Pure Nim stack implementation based on sequences.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-stacks-0_4_0.flake = false;
  inputs.src-stacks-0_4_0.type = "github";
  inputs.src-stacks-0_4_0.owner = "rustomax";
  inputs.src-stacks-0_4_0.repo = "nim-stacks";
  inputs.src-stacks-0_4_0.ref = "refs/tags/0.4.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stacks-0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stacks-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stacks-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}