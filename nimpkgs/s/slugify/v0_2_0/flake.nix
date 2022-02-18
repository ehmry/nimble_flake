{
  description = ''Convert strings to a slug. Can be used for URLs, file names, IDs etc.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-slugify-v0_2_0.flake = false;
  inputs.src-slugify-v0_2_0.type = "github";
  inputs.src-slugify-v0_2_0.owner = "lenniezelk";
  inputs.src-slugify-v0_2_0.repo = "slugify";
  inputs.src-slugify-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-slugify-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-slugify-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-slugify-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}