{
  description = ''Small and dependency free Nim package to infer file and MIME type checking the magic numbers signature.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-filetype-v0_7_1.flake = false;
  inputs.src-filetype-v0_7_1.type = "github";
  inputs.src-filetype-v0_7_1.owner = "jiro4989";
  inputs.src-filetype-v0_7_1.repo = "filetype";
  inputs.src-filetype-v0_7_1.ref = "refs/tags/v0.7.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-filetype-v0_7_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-filetype-v0_7_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-filetype-v0_7_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}