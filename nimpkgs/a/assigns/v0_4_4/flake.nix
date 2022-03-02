{
  description = ''syntax sugar for assignments'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-assigns-v0_4_4.flake = false;
  inputs.src-assigns-v0_4_4.type = "github";
  inputs.src-assigns-v0_4_4.owner = "metagn";
  inputs.src-assigns-v0_4_4.repo = "assigns";
  inputs.src-assigns-v0_4_4.ref = "refs/tags/v0.4.4";
  inputs.src-assigns-v0_4_4.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-assigns-v0_4_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-assigns-v0_4_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-assigns-v0_4_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}