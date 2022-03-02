{
  description = ''etcd client library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-etcd_client-0_2_0.flake = false;
  inputs.src-etcd_client-0_2_0.type = "github";
  inputs.src-etcd_client-0_2_0.owner = "FedericoCeratto";
  inputs.src-etcd_client-0_2_0.repo = "nim-etcd-client";
  inputs.src-etcd_client-0_2_0.ref = "refs/tags/0.2.0";
  inputs.src-etcd_client-0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-etcd_client-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-etcd_client-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-etcd_client-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}