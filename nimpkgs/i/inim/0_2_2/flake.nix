{
  description = ''Interactive Nim Shell'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-inim-0_2_2.flake = false;
  inputs.src-inim-0_2_2.type = "github";
  inputs.src-inim-0_2_2.owner = "inim-repl";
  inputs.src-inim-0_2_2.repo = "INim";
  inputs.src-inim-0_2_2.ref = "refs/tags/0.2.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-inim-0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-inim-0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-inim-0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}