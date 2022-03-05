{
  description = ''Erlang/Elixir NIFs for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimler-v4_3.flake = false;
  inputs.src-nimler-v4_3.type = "github";
  inputs.src-nimler-v4_3.owner = "wltsmrz";
  inputs.src-nimler-v4_3.repo = "nimler";
  inputs.src-nimler-v4_3.ref = "refs/tags/v4.3";
  inputs.src-nimler-v4_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimler-v4_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimler-v4_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimler-v4_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}