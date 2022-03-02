{
  description = ''Bindings for Simple and Fast Multimedia Library (through CSFML)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-csfml-v2_1_3.flake = false;
  inputs.src-csfml-v2_1_3.type = "github";
  inputs.src-csfml-v2_1_3.owner = "oprypin";
  inputs.src-csfml-v2_1_3.repo = "nim-csfml";
  inputs.src-csfml-v2_1_3.ref = "refs/tags/v2.1.3";
  inputs.src-csfml-v2_1_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-csfml-v2_1_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-csfml-v2_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-csfml-v2_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}