{
  description = ''A sugary for loop with syntax for typechecking loop variables'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-foreach-1_0_2.flake = false;
  inputs.src-foreach-1_0_2.type = "github";
  inputs.src-foreach-1_0_2.owner = "disruptek";
  inputs.src-foreach-1_0_2.repo = "foreach";
  inputs.src-foreach-1_0_2.ref = "refs/tags/1.0.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-foreach-1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-foreach-1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-foreach-1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}