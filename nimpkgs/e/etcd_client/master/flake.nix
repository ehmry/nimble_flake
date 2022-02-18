{
  description = ''etcd client library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-etcd_client-master.flake = false;
  inputs.src-etcd_client-master.type = "github";
  inputs.src-etcd_client-master.owner = "FedericoCeratto";
  inputs.src-etcd_client-master.repo = "nim-etcd-client";
  inputs.src-etcd_client-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-etcd_client-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-etcd_client-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-etcd_client-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}