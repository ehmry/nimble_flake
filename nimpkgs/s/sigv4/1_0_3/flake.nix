{
  description = ''Amazon Web Services Signature Version 4'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-sigv4-1_0_3.flake = false;
  inputs.src-sigv4-1_0_3.type = "github";
  inputs.src-sigv4-1_0_3.owner = "disruptek";
  inputs.src-sigv4-1_0_3.repo = "sigv4";
  inputs.src-sigv4-1_0_3.ref = "refs/tags/1.0.3";
  inputs.src-sigv4-1_0_3.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimcrypto".type = "github";
  inputs."nimcrypto".owner = "riinr";
  inputs."nimcrypto".repo = "flake-nimble";
  inputs."nimcrypto".ref = "flake-pinning";
  inputs."nimcrypto".dir = "nimpkgs/n/nimcrypto";
  inputs."nimcrypto".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimcrypto".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-sigv4-1_0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sigv4-1_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sigv4-1_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}