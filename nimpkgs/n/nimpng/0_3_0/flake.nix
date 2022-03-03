{
  description = ''PNG(Portable Network Graphics) encoder and decoder'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimPNG-0_3_0.flake = false;
  inputs.src-nimPNG-0_3_0.type = "github";
  inputs.src-nimPNG-0_3_0.owner = "jangko";
  inputs.src-nimPNG-0_3_0.repo = "nimPNG";
  inputs.src-nimPNG-0_3_0.ref = "refs/tags/0.3.0";
  inputs.src-nimPNG-0_3_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimPNG-0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimPNG-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimPNG-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}