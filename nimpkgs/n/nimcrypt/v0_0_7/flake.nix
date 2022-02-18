{
  description = ''Implementation of Unix crypt with support for Crypt-MD5, Crypt-SHA256 and Crypt-SHA512'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimcrypt-v0_0_7.flake = false;
  inputs.src-nimcrypt-v0_0_7.type = "github";
  inputs.src-nimcrypt-v0_0_7.owner = "napalu";
  inputs.src-nimcrypt-v0_0_7.repo = "nimcrypt";
  inputs.src-nimcrypt-v0_0_7.ref = "refs/tags/v0.0.7";
  
  
  inputs."nimcrypto".type = "github";
  inputs."nimcrypto".owner = "riinr";
  inputs."nimcrypto".repo = "flake-nimble";
  inputs."nimcrypto".ref = "flake-pinning";
  inputs."nimcrypto".dir = "nimpkgs/n/nimcrypto";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimcrypt-v0_0_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimcrypt-v0_0_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimcrypt-v0_0_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}