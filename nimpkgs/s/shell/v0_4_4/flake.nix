{
  description = ''A Nim mini DSL to execute shell commands'';
  inputs.src-shell-v0_4_4.flake = false;
  inputs.src-shell-v0_4_4.type = "github";
  inputs.src-shell-v0_4_4.owner = "Vindaar";
  inputs.src-shell-v0_4_4.repo = "shell";
  inputs.src-shell-v0_4_4.ref = "refs/tags/v0.4.4";
  
  outputs = { self, nixpkgs, src-shell-v0_4_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shell-v0_4_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-shell-v0_4_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}