{
  description = ''SSH, SCP and SFTP client for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-ssh2-master.flake = false;
  inputs.src-ssh2-master.type = "github";
  inputs.src-ssh2-master.owner = "ba0f3";
  inputs.src-ssh2-master.repo = "ssh2.nim";
  inputs.src-ssh2-master.ref = "refs/heads/master";
  
  
  inputs."libssh2".type = "github";
  inputs."libssh2".owner = "riinr";
  inputs."libssh2".repo = "flake-nimble";
  inputs."libssh2".ref = "flake-pinning";
  inputs."libssh2".dir = "nimpkgs/l/libssh2";

  outputs = { self, nixpkgs, flakeNimbleLib, src-ssh2-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ssh2-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ssh2-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}