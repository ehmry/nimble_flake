{
  description = ''Socks5 client and server library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-socks-master.flake = false;
  inputs.src-socks-master.type = "github";
  inputs.src-socks-master.owner = "FedericoCeratto";
  inputs.src-socks-master.repo = "nim-socks5";
  inputs.src-socks-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-socks-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-socks-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-socks-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}