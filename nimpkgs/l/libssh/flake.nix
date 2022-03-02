{
  description = ''libssh FFI bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."libssh-master".type = "github";
  inputs."libssh-master".owner = "riinr";
  inputs."libssh-master".repo = "flake-nimble";
  inputs."libssh-master".ref = "flake-pinning";
  inputs."libssh-master".dir = "nimpkgs/l/libssh/master";

    inputs."libssh-0_90_0".type = "github";
  inputs."libssh-0_90_0".owner = "riinr";
  inputs."libssh-0_90_0".repo = "flake-nimble";
  inputs."libssh-0_90_0".ref = "flake-pinning";
  inputs."libssh-0_90_0".dir = "nimpkgs/l/libssh/0_90_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}