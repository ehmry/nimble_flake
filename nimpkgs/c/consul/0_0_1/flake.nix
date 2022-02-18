{
  description = ''A simple interface to a running Consul agent.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-consul-0_0_1.flake = false;
  inputs.src-consul-0_0_1.type = "github";
  inputs.src-consul-0_0_1.owner = "makingspace";
  inputs.src-consul-0_0_1.repo = "nim_consul";
  inputs.src-consul-0_0_1.ref = "refs/tags/0.0.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-consul-0_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-consul-0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-consul-0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}