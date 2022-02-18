{
  description = ''Library for fast packet processing'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-dpdk-master.flake = false;
  inputs.src-dpdk-master.type = "github";
  inputs.src-dpdk-master.owner = "nimscale";
  inputs.src-dpdk-master.repo = "dpdk";
  inputs.src-dpdk-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-dpdk-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dpdk-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dpdk-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}