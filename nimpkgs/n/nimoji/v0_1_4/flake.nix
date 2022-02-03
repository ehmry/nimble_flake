{
  description = ''🍕🍺 emoji support for Nim 👑 and the world 🌍'';
  inputs.src-nimoji-v0_1_4.flake = false;
  inputs.src-nimoji-v0_1_4.type = "github";
  inputs.src-nimoji-v0_1_4.owner = "pietroppeter";
  inputs.src-nimoji-v0_1_4.repo = "nimoji";
  inputs.src-nimoji-v0_1_4.ref = "refs/tags/v0.1.4";
  
  outputs = { self, nixpkgs, src-nimoji-v0_1_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimoji-v0_1_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimoji-v0_1_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}