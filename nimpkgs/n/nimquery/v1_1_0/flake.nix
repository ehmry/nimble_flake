{
  description = ''Library for querying HTML using CSS-selectors, like JavaScripts document.querySelector'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimquery-v1_1_0.flake = false;
  inputs.src-nimquery-v1_1_0.type = "github";
  inputs.src-nimquery-v1_1_0.owner = "GULPF";
  inputs.src-nimquery-v1_1_0.repo = "nimquery";
  inputs.src-nimquery-v1_1_0.ref = "refs/tags/v1.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimquery-v1_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimquery-v1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimquery-v1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}