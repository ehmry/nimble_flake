{
  description = ''Serializer and tools for flat binary files.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-flatty-0_2_3.flake = false;
  inputs.src-flatty-0_2_3.type = "github";
  inputs.src-flatty-0_2_3.owner = "treeform";
  inputs.src-flatty-0_2_3.repo = "flatty";
  inputs.src-flatty-0_2_3.ref = "refs/tags/0.2.3";
  inputs.src-flatty-0_2_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-flatty-0_2_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-flatty-0_2_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-flatty-0_2_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}