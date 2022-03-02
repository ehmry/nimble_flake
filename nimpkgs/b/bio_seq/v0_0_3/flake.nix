{
  description = ''A Nim library for biological sequence data.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-bio_seq-v0_0_3.flake = false;
  inputs.src-bio_seq-v0_0_3.type = "github";
  inputs.src-bio_seq-v0_0_3.owner = "kerrycobb";
  inputs.src-bio_seq-v0_0_3.repo = "BioSeq";
  inputs.src-bio_seq-v0_0_3.ref = "refs/tags/v0.0.3";
  inputs.src-bio_seq-v0_0_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-bio_seq-v0_0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bio_seq-v0_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bio_seq-v0_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}