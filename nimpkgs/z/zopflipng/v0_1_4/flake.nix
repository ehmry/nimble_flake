{
  description = ''zopflipng-like png optimization'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-zopflipng-v0_1_4.flake = false;
  inputs.src-zopflipng-v0_1_4.type = "github";
  inputs.src-zopflipng-v0_1_4.owner = "bung87";
  inputs.src-zopflipng-v0_1_4.repo = "zopflipng";
  inputs.src-zopflipng-v0_1_4.ref = "refs/tags/v0.1.4";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-zopflipng-v0_1_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zopflipng-v0_1_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-zopflipng-v0_1_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}