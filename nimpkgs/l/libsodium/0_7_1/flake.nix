{
  description = ''libsodium wrapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-libsodium-0_7_1.flake = false;
  inputs.src-libsodium-0_7_1.type = "github";
  inputs.src-libsodium-0_7_1.owner = "FedericoCeratto";
  inputs.src-libsodium-0_7_1.repo = "nim-libsodium";
  inputs.src-libsodium-0_7_1.ref = "refs/tags/0.7.1";
  inputs.src-libsodium-0_7_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-libsodium-0_7_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-libsodium-0_7_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-libsodium-0_7_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}