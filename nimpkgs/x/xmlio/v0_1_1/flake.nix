{
  description = ''Mapping nim type to xml node, and parse from it.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-xmlio-v0_1_1.flake = false;
  inputs.src-xmlio-v0_1_1.type = "github";
  inputs.src-xmlio-v0_1_1.owner = "codehz";
  inputs.src-xmlio-v0_1_1.repo = "xmlio";
  inputs.src-xmlio-v0_1_1.ref = "refs/tags/v0.1.1";
  
  
  inputs."vtable".type = "github";
  inputs."vtable".owner = "riinr";
  inputs."vtable".repo = "flake-nimble";
  inputs."vtable".ref = "flake-pinning";
  inputs."vtable".dir = "nimpkgs/v/vtable";

  outputs = { self, nixpkgs, flakeNimbleLib, src-xmlio-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-xmlio-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-xmlio-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}