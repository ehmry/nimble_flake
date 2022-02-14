{
  description = ''Local webserver for Design Prototyping and Front-end Development'';
  inputs.src-madam-main.flake = false;
  inputs.src-madam-main.type = "github";
  inputs.src-madam-main.owner = "openpeep";
  inputs.src-madam-main.repo = "madam";
  inputs.src-madam-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, src-madam-main, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-madam-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-madam-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}