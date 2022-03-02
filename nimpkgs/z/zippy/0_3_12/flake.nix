{
  description = ''Pure Nim implementation of deflate, zlib, gzip and zip.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-zippy-0_3_12.flake = false;
  inputs.src-zippy-0_3_12.type = "github";
  inputs.src-zippy-0_3_12.owner = "guzba";
  inputs.src-zippy-0_3_12.repo = "zippy";
  inputs.src-zippy-0_3_12.ref = "refs/tags/0.3.12";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-zippy-0_3_12, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zippy-0_3_12;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-zippy-0_3_12"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}