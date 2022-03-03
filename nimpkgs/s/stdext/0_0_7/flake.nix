{
  description = ''Extends stdlib make it easy on some case'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-stdext-0_0_7.flake = false;
  inputs.src-stdext-0_0_7.type = "github";
  inputs.src-stdext-0_0_7.owner = "zendbit";
  inputs.src-stdext-0_0_7.repo = "nim.stdext";
  inputs.src-stdext-0_0_7.ref = "refs/tags/0.0.7";
  inputs.src-stdext-0_0_7.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stdext-0_0_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stdext-0_0_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stdext-0_0_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}