{
  description = ''Renormalization of colloidal charges of polydipserse dispersions using the Poisson-Boltzmann equation'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-polypbren-v0_4-paper.flake = false;
  inputs.src-polypbren-v0_4-paper.type = "github";
  inputs.src-polypbren-v0_4-paper.owner = "guibar64";
  inputs.src-polypbren-v0_4-paper.repo = "polypbren";
  inputs.src-polypbren-v0_4-paper.ref = "refs/tags/v0.4-paper";
  inputs.src-polypbren-v0_4-paper.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-polypbren-v0_4-paper, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-polypbren-v0_4-paper;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-polypbren-v0_4-paper"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}