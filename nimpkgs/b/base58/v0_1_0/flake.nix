{
  description = ''Base58 encoders and decoders for Bitcoin and CryptoNote addresses.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-base58-v0_1_0.flake = false;
  inputs.src-base58-v0_1_0.type = "other";
  inputs.src-base58-v0_1_0.owner = "~ehmry";
  inputs.src-base58-v0_1_0.repo = "nim_base58";
  inputs.src-base58-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-base58-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-base58-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-base58-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-base58-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}