{
  description = ''High level GObject-Introspection based GTK3 bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-gintro-v0_4_18.flake = false;
  inputs.src-gintro-v0_4_18.type = "github";
  inputs.src-gintro-v0_4_18.owner = "stefansalewski";
  inputs.src-gintro-v0_4_18.repo = "gintro";
  inputs.src-gintro-v0_4_18.ref = "refs/tags/v0.4.18";
  inputs.src-gintro-v0_4_18.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gintro-v0_4_18, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gintro-v0_4_18;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gintro-v0_4_18"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}