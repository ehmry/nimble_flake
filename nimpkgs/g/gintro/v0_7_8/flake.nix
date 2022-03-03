{
  description = ''High level GObject-Introspection based GTK3 bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-gintro-v0_7_8.flake = false;
  inputs.src-gintro-v0_7_8.type = "github";
  inputs.src-gintro-v0_7_8.owner = "stefansalewski";
  inputs.src-gintro-v0_7_8.repo = "gintro";
  inputs.src-gintro-v0_7_8.ref = "refs/tags/v0.7.8";
  inputs.src-gintro-v0_7_8.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gintro-v0_7_8, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gintro-v0_7_8;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gintro-v0_7_8"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}