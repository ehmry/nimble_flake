{
  description = ''Wrapper for AutoIt v3.3.14.2'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-autonim-main.flake = false;
  inputs.src-autonim-main.type = "github";
  inputs.src-autonim-main.owner = "guevara-chan";
  inputs.src-autonim-main.repo = "AutoNim";
  inputs.src-autonim-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-autonim-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-autonim-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-autonim-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}