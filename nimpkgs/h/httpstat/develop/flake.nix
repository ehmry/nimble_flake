{
  description = ''curl statistics made simple '';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-httpstat-develop.flake = false;
  inputs.src-httpstat-develop.type = "github";
  inputs.src-httpstat-develop.owner = "ucpr";
  inputs.src-httpstat-develop.repo = "httpstat";
  inputs.src-httpstat-develop.ref = "refs/heads/develop";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-httpstat-develop, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-httpstat-develop;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-httpstat-develop"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}