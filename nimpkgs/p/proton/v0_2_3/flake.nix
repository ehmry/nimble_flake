{
  description = ''Proton template engine for xml and xhtml files'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-proton-v0_2_3.flake = false;
  inputs.src-proton-v0_2_3.type = "github";
  inputs.src-proton-v0_2_3.owner = "jasonrbriggs";
  inputs.src-proton-v0_2_3.repo = "proton-nim";
  inputs.src-proton-v0_2_3.ref = "refs/tags/v0.2.3";
  inputs.src-proton-v0_2_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-proton-v0_2_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-proton-v0_2_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-proton-v0_2_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}