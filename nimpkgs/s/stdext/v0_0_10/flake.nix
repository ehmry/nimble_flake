{
  description = ''Extends stdlib make it easy on some case'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-stdext-v0_0_10.flake = false;
  inputs.src-stdext-v0_0_10.type = "github";
  inputs.src-stdext-v0_0_10.owner = "zendbit";
  inputs.src-stdext-v0_0_10.repo = "nim.stdext";
  inputs.src-stdext-v0_0_10.ref = "refs/tags/v0.0.10";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stdext-v0_0_10, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stdext-v0_0_10;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stdext-v0_0_10"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}