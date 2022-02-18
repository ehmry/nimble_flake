{
  description = ''A wrapper for the zip library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-zip-0_3_1.flake = false;
  inputs.src-zip-0_3_1.type = "github";
  inputs.src-zip-0_3_1.owner = "nim-lang";
  inputs.src-zip-0_3_1.repo = "zip";
  inputs.src-zip-0_3_1.ref = "refs/tags/0.3.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-zip-0_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zip-0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-zip-0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}