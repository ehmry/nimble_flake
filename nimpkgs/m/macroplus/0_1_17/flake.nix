{
  description = ''a collection of useful macro functionalities'';
  inputs.src-macroplus-0_1_17.flake = false;
  inputs.src-macroplus-0_1_17.type = "github";
  inputs.src-macroplus-0_1_17.owner = "hamidb80";
  inputs.src-macroplus-0_1_17.repo = "macroplus";
  inputs.src-macroplus-0_1_17.ref = "refs/tags/0.1.17";
  
  outputs = { self, nixpkgs, src-macroplus-0_1_17, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-macroplus-0_1_17;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-macroplus-0_1_17"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}