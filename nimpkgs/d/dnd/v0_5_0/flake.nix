{
  description = ''Drag and drop source / target'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-dnd-v0_5_0.flake = false;
  inputs.src-dnd-v0_5_0.type = "github";
  inputs.src-dnd-v0_5_0.owner = "adokitkat";
  inputs.src-dnd-v0_5_0.repo = "dnd";
  inputs.src-dnd-v0_5_0.ref = "refs/tags/v0.5.0";
  inputs.src-dnd-v0_5_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."gintro".type = "github";
  # inputs."gintro".owner = "riinr";
  # inputs."gintro".repo = "flake-nimble";
  # inputs."gintro".ref = "flake-pinning";
  # inputs."gintro".dir = "nimpkgs/g/gintro";
  # inputs."gintro".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."gintro".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-dnd-v0_5_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dnd-v0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dnd-v0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}