{
  description = ''A Nim library for biological sequence data.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-bio_seq-v_0_0_2.flake = false;
  inputs.src-bio_seq-v_0_0_2.type = "github";
  inputs.src-bio_seq-v_0_0_2.owner = "kerrycobb";
  inputs.src-bio_seq-v_0_0_2.repo = "BioSeq";
  inputs.src-bio_seq-v_0_0_2.ref = "refs/tags/v.0.0.2";
  inputs.src-bio_seq-v_0_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-bio_seq-v_0_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bio_seq-v_0_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bio_seq-v_0_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}